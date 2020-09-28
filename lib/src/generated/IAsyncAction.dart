// IAsyncAction.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../com/combase.dart';
import '../constants.dart';
import '../exceptions.dart';
import '../macros.dart';
import '../ole32.dart';
import '../structs.dart';

import '../winrt/winrt_constants.dart';

import 'IInspectable.dart';

/// @nodoc
const IID_IAsyncAction = '{5A648006-843A-4DA9-865B-9D26E5DFAD7B}';

typedef _put_Completed_Native = Int32 Function(Pointer obj, IntPtr handler);
typedef _put_Completed_Dart = int Function(Pointer obj, int handler);

typedef _get_Completed_Native = Int32 Function(
    Pointer obj, Pointer<IntPtr> value);
typedef _get_Completed_Dart = int Function(Pointer obj, Pointer<IntPtr> value);

typedef _GetResults_Native = Int32 Function(Pointer obj);
typedef _GetResults_Dart = int Function(Pointer obj);

/// {@category Interface}
/// {@category winrt}
class IAsyncAction extends IInspectable {
  // vtable begins at 6, ends at 8

  IAsyncAction(Pointer<COMObject> ptr) : super(ptr);

  set Completed(int value) {
    final hr = Pointer<NativeFunction<_put_Completed_Native>>.fromAddress(
            ptr.ref.vtable.elementAt(6).value)
        .asFunction<_put_Completed_Dart>()(ptr.ref.lpVtbl, value);

    if (FAILED(hr)) throw WindowsException(hr);
  }

  int get Completed {
    final retValuePtr = allocate<IntPtr>();

    final hr = Pointer<NativeFunction<_get_Completed_Native>>.fromAddress(
            ptr.ref.vtable.elementAt(7).value)
        .asFunction<_get_Completed_Dart>()(ptr.ref.lpVtbl, retValuePtr);
    if (FAILED(hr)) throw WindowsException(hr);

    final retValue = retValuePtr.value;
    free(retValuePtr);
    return retValue;
  }

  int GetResults() => Pointer<NativeFunction<_GetResults_Native>>.fromAddress(
          ptr.ref.vtable.elementAt(8).value)
      .asFunction<_GetResults_Dart>()(ptr.ref.lpVtbl);
}
