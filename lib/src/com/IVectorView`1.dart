// IVectorView.dart

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
const IID_IVectorView = '{BBE1FA4C-B0E3-4583-BAEF-1F1B2E483E56}';

typedef _GetAt_Native = Int32 Function(
    Pointer obj, Uint32 index, Pointer<Pointer> result);
typedef _GetAt_Dart = int Function(
    Pointer obj, int index, Pointer<Pointer> result);

typedef _get_Size_Native = Int32 Function(Pointer obj, Pointer<Uint32> value);
typedef _get_Size_Dart = int Function(Pointer obj, Pointer<Uint32> value);

typedef _IndexOf_Native = Int32 Function(Pointer obj, Pointer value, Pointer<Uint32> index,
    Pointer< /* Boolean */ Uint8> result);
typedef _IndexOf_Dart = int Function(Pointer obj, Pointer value, Pointer<Uint32> index,
    Pointer< /* Boolean */ Uint8> result);

typedef _GetMany_Native = Int32 Function(
    Pointer obj, Uint32 startIndex, Pointer<Pointer> items, Pointer<Uint32> result);
typedef _GetMany_Dart = int Function(
    Pointer obj, int startIndex, Pointer<Pointer> items, Pointer<Uint32> result);

/// {@category Interface}
/// {@category winrt}
class IVectorView<T> {
  // vtable begins at 6, ends at 9

  Pointer<COMObject> ptr;

  IVectorView(this.ptr);

  int GetAt(int index, Pointer<Pointer> result) => ptr.ref.lpVtbl.value
      .elementAt(6)
      .cast<Pointer<NativeFunction<_GetAt_Native>>>()
      .value
      .asFunction<_GetAt_Dart>()(ptr.ref.lpVtbl, index, result);

  int get Size {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.lpVtbl.value
          .elementAt(7)
          .cast<Pointer<NativeFunction<_get_Size_Native>>>()
          .value
          .asFunction<_get_Size_Dart>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  int IndexOf(
          Pointer value, Pointer<Uint32> index, Pointer< /* Boolean */ Uint8> result) =>
      ptr.ref.lpVtbl.value
          .elementAt(8)
          .cast<Pointer<NativeFunction<_IndexOf_Native>>>()
          .value
          .asFunction<_IndexOf_Dart>()(ptr.ref.lpVtbl, value, index, result);

  int GetMany(int startIndex, Pointer<Pointer> items, Pointer<Uint32> result) => ptr
      .ref.lpVtbl.value
      .elementAt(9)
      .cast<Pointer<NativeFunction<_GetMany_Native>>>()
      .value
      .asFunction<_GetMany_Dart>()(ptr.ref.lpVtbl, startIndex, items, result);
}
