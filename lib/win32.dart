// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: directives_ordering

/// Support for programming against the Win32 API on Windows operating systems.
///
/// This library provides a wrapper around many useful functions from the API,
/// along with the necessary constants and structs that are supplied. With
/// thousands of APIs and interfaces in the Win32 API, many of which cover areas
/// that would be unlikely to be useful to a Dart or Flutter developer, this
/// library is not intended to be exhaustive. Instead, we focus on the core
/// Win32 APIs that are typically used for Windows development, along with
/// Win32, COM and Windows Runtime APIs that are likely to be wrapped by a
/// Flutter plugin author.
///
/// Win32 is at its heart a C-based API, and accordingly adopts the style and
/// idioms of that language, including heavy usage of pointers, structs
/// allocated on the heap, and null-terminated strings. As a result, you may
/// choose to wrap the exposed APIs in your application to make their invocation
/// more idiomatic for a Dart consumer.
///
/// ## Strings (Win32 and COM)
///
/// Win32 strings are typically stored as null-terminated arrays of UTF-16 code
/// units. (Some older Windows APIs also offer an ANSI, or 8-bit representation,
/// but we use the wide versions, which are suffixed with a capital 'W' (e.g.
/// `FormatMessageW`).
///
/// You can use the [toNativeUtf16] function to convert a Dart string into a
/// `Pointer<Utf16>`, which can be passed to any Windows API expecting a string,
/// for example:
/// ```dart
///   final verb = 'open'.toNativeUtf16();
///   final process = 'notepad.exe'.toNativeUtf16();
///   ShellExecute(0, verb, process, nullptr, nullptr, SW_SHOW);
/// ```
///
/// Note that it is your responsibility to release the memory used when you are
/// finished with it.
///
/// To receive a string, allocate memory with a command like the following:
/// ```dart
///   final buffer = wsalloc(length);
///   GetWindowText(hWnd, buffer, length);
/// ```
///
/// This allocates an array of `length` UTF-16 code units. The cast is necessary
/// because Utf16 has no length of itself. The returned value can be converted
/// back to a Dart string using an extension method on Pointer<Utf16>, as
/// follows:
/// ```dart
///   print(buffer.toDartString());
/// ```
///
/// A small number of APIs offer no wide version (e.g. `GetProcAddress`), and so
/// the [convertToANSIString] method may be of use to convert a Dart string to a
/// `Pointer<Uint8>`, which represents this format:
/// ```dart
///   final ansi = convertToANSIString('Beep');
///   final pGetNativeSystemInfo = GetProcAddress(hModule, ansi);
///   ...
///   free(ansi);
/// ```
///
/// ## Strings (Windows Runtime)
///
/// Windows Runtime APIs use `HSTRING` as their native type, which is created
/// with the [WindowsCreateString] API and deleted with the
/// [WindowsDeleteString] API. A Dart function may be used to convert to and
/// from `HSTRING`s, for example:
/// ```dart
///   final systemPtr = calloc<HSTRING>();
///   calendar.GetCalendarSystem(systemPtr);
///   print('The calendar system is ${convertFromHString(systemPtr)}.');
///   WindowsDeleteString(systemPtr.value);
///   free(systemPtr);
/// ```
///
/// Make sure you dispose of `HSTRING`s by calling `WindowsDeleteString` and
/// passing the string address itself, not the pointer, as shown above.
library win32;

// Core Win32 APIs, constants and macros
export 'src/callbacks.dart';
export 'src/constants.dart';
export 'src/constants_nodoc.dart';
export 'src/exceptions.dart';
export 'src/macros.dart';
export 'src/structs.dart';
export 'src/structs.g.dart';
export 'src/utils.dart';

// Useful extension methods
export 'src/extensions/dialogs.dart';
export 'src/extensions/int_to_hexstring.dart';
export 'src/extensions/list_to_blob.dart';
export 'src/extensions/set_ansi.dart';
export 'src/extensions/set_string.dart';
export 'src/extensions/set_string_array.dart';
export 'src/extensions/unpack_utf16.dart';

// Traditional C-style Windows APIs
export 'src/advapi32.dart';
export 'src/bthprops.dart';
export 'src/combase.dart';
export 'src/comctl32.dart';
export 'src/comdlg32.dart';
export 'src/dbghelp.dart';
export 'src/dxva2.dart';
export 'src/gdi32.dart';
export 'src/kernel32.dart';
export 'src/kernelbase.dart';
export 'src/ole32.dart';
export 'src/oleaut32.dart';
export 'src/powrprof.dart';
export 'src/rometadata.dart';
export 'src/scarddlg.dart';
export 'src/shcore.dart';
export 'src/shell32.dart';
export 'src/types.dart';
export 'src/user32.dart';
export 'src/version.dart';
export 'src/winmm.dart';
export 'src/winscard.dart';

export 'src/api-ms-win-core-winrt-l1-1-0.dart';
export 'src/api-ms-win-core-winrt-string-l1-1-0.dart';
export 'src/api-ms-win-ro-typeresolution-l1-1-0.dart';

// WinRT foundational exports
export 'src/winrt/winrt_constants.dart';
export 'src/winrt/winrt_helpers.dart';

// COM and Windows Runtime interfaces

export 'src/com/IApplicationActivationManager.dart';
export 'src/com/IApplicationActivationManager.dart';
export 'src/com/IAppxFactory.dart';
export 'src/com/IAppxFactory.dart';
export 'src/com/IAppxFile.dart';
export 'src/com/IAppxFilesEnumerator.dart';
export 'src/com/IAppxManifestApplication.dart';
export 'src/com/IAppxManifestApplicationsEnumerator.dart';
export 'src/com/IAppxManifestOSPackageDependency.dart';
export 'src/com/IAppxManifestPackageDependenciesEnumerator.dart';
export 'src/com/IAppxManifestPackageDependency.dart';
export 'src/com/IAppxManifestPackageId.dart';
export 'src/com/IAppxManifestProperties.dart';
export 'src/com/IAppxManifestReader.dart';
export 'src/com/IAppxManifestReader2.dart';
export 'src/com/IAppxManifestReader3.dart';
export 'src/com/IAppxManifestReader4.dart';
export 'src/com/IAppxManifestReader5.dart';
export 'src/com/IAppxManifestReader6.dart';
export 'src/com/IAppxManifestReader7.dart';
export 'src/com/IAppxPackageReader.dart';
export 'src/com/IAsyncAction.dart';
export 'src/com/IAsyncInfo.dart';
export 'src/com/IBindCtx.dart';
export 'src/com/ICalendar.dart';
export 'src/com/IClassFactory.dart';
export 'src/com/IConnectionPoint.dart';
export 'src/com/IConnectionPointContainer.dart';
export 'src/com/IDesktopWallpaper.dart';
export 'src/com/IDispatch.dart';
export 'src/com/IEnumIDList.dart';
export 'src/com/IEnumMoniker.dart';
export 'src/com/IEnumNetworkConnections.dart';
export 'src/com/IEnumNetworks.dart';
export 'src/com/IEnumResources.dart';
export 'src/com/IEnumSpellingError.dart';
export 'src/com/IEnumString.dart';
export 'src/com/IEnumVARIANT.dart';
export 'src/com/IEnumWbemClassObject.dart';
export 'src/com/IErrorInfo.dart';
export 'src/com/IFileDialog.dart';
export 'src/com/IFileDialog2.dart';
export 'src/com/IFileDialogCustomize.dart';
export 'src/com/IFileIsInUse.dart';
export 'src/com/IFileOpenDialog.dart';
export 'src/com/IFileOpenPicker.dart';
export 'src/com/IFileSaveDialog.dart';
export 'src/com/IInspectable.dart';
export 'src/com/IKnownFolder.dart';
export 'src/com/IKnownFolderManager.dart';
export 'src/com/IModalWindow.dart';
export 'src/com/IMoniker.dart';
export 'src/com/INetwork.dart';
export 'src/com/INetworkConnection.dart';
export 'src/com/INetworkListManager.dart';
export 'src/com/INetworkListManagerEvents.dart';
export 'src/com/IPersist.dart';
export 'src/com/IPersistFile.dart';
export 'src/com/IPersistMemory.dart';
export 'src/com/IPersistStream.dart';
export 'src/com/IPropertyValue.dart';
export 'src/com/IProvideClassInfo.dart';
export 'src/com/IRunningObjectTable.dart';
export 'src/com/ISequentialStream.dart';
export 'src/com/IShellFolder.dart';
export 'src/com/IShellItem.dart';
export 'src/com/IShellItem2.dart';
export 'src/com/IShellItemArray.dart';
export 'src/com/IShellItemFilter.dart';
export 'src/com/IShellItemResources.dart';
export 'src/com/IShellLinkDataList.dart';
export 'src/com/IShellLinkDual.dart';
export 'src/com/IShellLink.dart';
export 'src/com/IShellService.dart';
export 'src/com/ISpellChecker.dart';
export 'src/com/ISpellCheckerChangedEventHandler.dart';
export 'src/com/ISpellCheckerFactory.dart';
export 'src/com/ISpellingError.dart';
export 'src/com/IStream.dart';
export 'src/com/ISupportErrorInfo.dart';
export 'src/com/ITypeInfo.dart';
export 'src/com/IUnknown.dart';
export 'src/com/IUri.dart';
export 'src/com/IUserDataPathsStatics.dart';
export 'src/com/IVirtualDesktopManager.dart';
export 'src/com/IWbemClassObject.dart';
export 'src/com/IWbemContext.dart';
export 'src/com/IWbemLocator.dart';
export 'src/com/IWbemServices.dart';
export 'src/com/IXmlNodeList.dart';
export 'src/com/UserDataPaths.dart';
