// IXmlNodeList.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../combase.dart';
import '../constants.dart';
import '../exceptions.dart';
import '../macros.dart';
import '../ole32.dart';
import '../structs.dart';
import '../structs.g.dart';
import '../utils.dart';

import '../winrt/winrt_constants.dart';

/// @nodoc
const IID_IXmlNodeList = '{8C60AD77-83A4-4EC1-9C54-7BA429E13DA6}';

typedef _get_Length_Native = Int32 Function(Pointer obj, Pointer<Uint32> value);
typedef _get_Length_Dart = int Function(Pointer obj, Pointer<Uint32> value);

typedef _Item_Native = Int32 Function(
    Pointer obj, Uint32 index, Pointer<Pointer> result);
typedef _Item_Dart = int Function(
    Pointer obj, int index, Pointer<Pointer> result);

/// {@category Interface}
/// {@category winrt}
class IXmlNodeList {
  // vtable begins at 15, ends at 16

  Pointer<COMObject> ptr;

  IXmlNodeList(this.ptr);

  int get Length {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.lpVtbl.value
          .elementAt(15)
          .cast<Pointer<NativeFunction<_get_Length_Native>>>()
          .value
          .asFunction<_get_Length_Dart>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  int Item(int index, Pointer<Pointer> result) => ptr.ref.lpVtbl.value
      .elementAt(16)
      .cast<Pointer<NativeFunction<_Item_Native>>>()
      .value
      .asFunction<_Item_Dart>()(ptr.ref.lpVtbl, index, result);
}
