// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Shows retrieval of various information from the IDesktopWallpaper interface.

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void printWallpaper(IDesktopWallpaper wallpaper) {
  final pathPtr = calloc<Pointer<Utf16>>();

  try {
    final hr = wallpaper.GetWallpaper(nullptr, pathPtr);

    switch (hr) {
      case S_OK:
        final path = pathPtr.value.toDartString();
        print(
            path.isEmpty ? 'No wallpaper is set.' : 'Wallpaper path is: $path');
        break;

      case S_FALSE:
        print('Different monitors are displaying different wallpapers, or a '
            'slideshow is running.');
        break;

      default:
        throw WindowsException(hr);
    }
  } finally {
    free(pathPtr);
  }
}

IDesktopWallpaper createObject() {
  final ptr = calloc<COMObject>();
  final clsid = calloc<GUID>()..ref.setGUID(CLSID_DesktopWallpaper);
  final iid = calloc<GUID>()..ref.setGUID(IID_IDesktopWallpaper);

  try {
    final hr = CoCreateInstance(clsid, nullptr, CLSCTX_ALL, iid, ptr.cast());

    if (FAILED(hr)) throw WindowsException(hr);

    return IDesktopWallpaper(ptr);
  } finally {
    free(clsid);
    free(iid);
  }
}

void main() {
  final hr = CoInitializeEx(
      nullptr, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);

  if (FAILED(hr)) {
    throw WindowsException(hr);
  }

  final wallpaper = createObject();

  try {
    printWallpaper(wallpaper);
  } finally {
    free(wallpaper.ptr);
    CoUninitialize();
  }
}
