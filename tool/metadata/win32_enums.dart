import 'dart:io';

import 'package:win32/win32.dart';
import 'package:winmd/winmd.dart';

List<String> namespaces = [];

void initNamespaces(Scope scope) {
  // Use a Set to avoid duplication
  final namespaceSet = <String>{};

  final scope = MetadataStore.getScopeForFile('tool/win32/Windows.Win32.winmd');
  for (final td in scope.typeDefs) {
    if (td.typeName.startsWith('Windows.Win32')) {
      final namespace = td.typeName.split('.')[2];
      namespaceSet.add('Windows.Win32.$namespace');
    }
  }
  namespaces = namespaceSet.toList()..sort((a, b) => a.compareTo(b));
}

String processEnumeration(Enumeration enumClass) {
  final buffer = StringBuffer();

  // Get the enum name
  var dartClass = enumClass.typeName.split('.').last;

  // Dart treats types beginning with _ as private to the library
  while (dartClass.startsWith('_')) {
    dartClass = dartClass.substring(1);
  }

  // Some weirdness in Win32 metadata, see:
  // https://github.com/microsoft/win32metadata/issues/297
  if (dartClass.startsWith('MIDL___')) {
    return '';
  }

  buffer.writeln('/// {@category Enum}');
  buffer.writeln('class $dartClass {');

  // The first field is always the special field _value
  for (final field in enumClass.fields.keys.skip(1)) {
    if (field != null && field.startsWith('_')) continue;

    final value = enumClass.fields[field]!.toHexString(32);
    buffer.writeln('  static const $field = $value;');
  }

  buffer.writeln('}\n');

  return buffer.toString();
}

void main() {
  final scope = MetadataStore.getScopeForFile('tool/win32/Windows.Win32.winmd');
  initNamespaces(scope);

  for (final namespace in namespaces) {
    final folderName = namespace.split('.').last.toLowerCase();

    final filteredEnums =
        scope.enums.where((typedef) => typedef.typeName.startsWith(namespace));

    if (filteredEnums.isNotEmpty) {
      Directory('lib/src/$folderName').createSync();

      final writer =
          File('lib/src/$folderName/enums.dart').openSync(mode: FileMode.write);

      final enumsLength = filteredEnums.length;
      print('Processing $enumsLength enums in $namespace');
      final buffer = StringBuffer();

      for (final enumClass in filteredEnums) {
        buffer.write(processEnumeration(enumClass));
      }
      writer.writeStringSync(buffer.toString());
    }
  }
}