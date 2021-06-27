// IIterable.dart

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

import 'IInspectable.dart';
/// @nodoc
const IID_IIterable = '{FAA585EA-6214-4217-AFDA-7F46DE5869B3}';

typedef _First_Native = Int32 Function(
  Pointer obj,
  Pointer<Pointer> result
);
typedef _First_Dart = int Function(
  Pointer obj,
  Pointer<Pointer> result
);

/// {@category Interface}
/// {@category winrt}
class IIterable<T> extends IInspectable {
  // vtable begins at 6, ends at 6

   IIterable(Pointer<COMObject> ptr) : super(ptr);

  int First(Pointer<Pointer> result) => ptr.ref.lpVtbl.value      .elementAt(6)
      .cast<Pointer<NativeFunction<_First_Native>>>()
      .value
      .asFunction<_First_Dart>()(ptr.ref.lpVtbl, result);

}


