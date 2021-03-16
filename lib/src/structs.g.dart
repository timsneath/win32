// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart representations of common structs used in the Win32 API.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// -----------------------------------------------------------------------------
// Linter exceptions
// -----------------------------------------------------------------------------
// ignore_for_file: camel_case_types ignore_for_file: camel_case_extensions
//
// Why? The linter defaults to throw a warning for types not named as camel
// case. We deliberately break this convention to match the Win32 underlying
// types.
//
//
// ignore_for_file: unused_field
//
// Why? The linter complains about unused fields (e.g. a class that contains
// underscore-prefixed members that are not used in the library. In this class,
// we use this feature to ensure that sizeOf<STRUCT_NAME> returns a size at
// least as large as the underlying native struct. See, for example,
// ENUMLOGFONTEX.
//
//
// ignore_for_file: unnecessary_getters_setters
//
// Why? In structs like VARIANT, we're using getters and setters to project the
// same underlying data property to various union types. The trivial overhead is
// outweighed by readability.
//
//
// ignore_for_file: unused_import
//
// Why? We speculatively include some imports that we might generate a
// requirement for.
// -----------------------------------------------------------------------------

import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'callbacks.dart';
import 'com/IDispatch.dart';
import 'com/IUnknown.dart';
import 'combase.dart';
import 'oleaut32.dart';
import 'structs.dart';

/// The ACTCTX structure is used by the CreateActCtx function to create the
/// activation context.
///
/// {@category Struct}
class ACTCTX extends Struct {
  @Uint32()
  external int cbSize;
  @Uint32()
  external int dwFlags;
  external Pointer<Utf16> lpSource;
  @Uint16()
  external int wProcessorArchitecture;
  @Uint16()
  external int wLangId;
  external Pointer<Utf16> lpAssemblyDirectory;
  external Pointer<Utf16> lpResourceName;
  external Pointer<Utf16> lpApplicationName;
  @IntPtr()
  external int hModule;
}

/// Contains parameters used during a moniker-binding operation.
///
/// {@category Struct}
class BIND_OPTS extends Struct {
  @Uint32()
  external int cbStruct;
  @Uint32()
  external int grfFlags;
  @Uint32()
  external int grfMode;
  @Uint32()
  external int dwTickCountDeadline;
}

/// Defines the initialization parameters passed to the window procedure of
/// an application. These members are identical to the parameters of the
/// CreateWindowEx function.
///
/// {@category Struct}
class CREATESTRUCT extends Struct {
  external Pointer lpCreateParams;
  @IntPtr()
  external int hInstance;
  @IntPtr()
  external int hMenu;
  @IntPtr()
  external int hwndParent;
  @Int32()
  external int cy;
  @Int32()
  external int cx;
  @Int32()
  external int y;
  @Int32()
  external int x;
  @Int32()
  external int style;
  external Pointer<Utf16> lpszName;
  external Pointer<Utf16> lpszClass;
  @Uint32()
  external int dwExStyle;
}

/// The LOGBRUSH structure defines the style, color, and pattern of a
/// physical brush. It is used by the CreateBrushIndirect and ExtCreatePen
/// functions.
///
/// {@category Struct}
class LOGBRUSH extends Struct {
  @Uint32()
  external int lbStyle;
  @Uint32()
  external int lbColor;
  @IntPtr()
  external int lbHatch;
}

/// The MCI_PLAY_PARMS structure contains positioning information for the
/// MCI_PLAY command.
///
/// {@category Struct}
class MCI_PLAY_PARMS extends Struct {
  @IntPtr()
  external int dwCallback;
  @Uint32()
  external int dwFrom;
  @Uint32()
  external int dwTo;
}

/// The MCI_STATUS_PARMS structure contains information for the MCI_STATUS
/// command.
///
/// {@category Struct}
class MCI_STATUS_PARMS extends Struct {
  @IntPtr()
  external int dwCallback;
  @IntPtr()
  external int dwReturn;
  @Uint32()
  external int dwItem;
  @Uint32()
  external int dwTrack;
}

/// The MONITORINFO structure contains information about a display monitor.
///
/// {@category Struct}
class MONITORINFO extends Struct {
  @Uint32()
  external int cbSize;
  external RECT rcMonitor;
  external RECT rcWork;
  @Uint32()
  external int dwFlags;
}

/// Contains information about the mouse's location in screen coordinates.
///
/// {@category Struct}
class MOUSEMOVEPOINT extends Struct {
  @Int32()
  external int x;
  @Int32()
  external int y;
  @Uint32()
  external int time;
  @IntPtr()
  external int dwExtraInfo;
}

/// Contains information about a newly created process and its primary
/// thread. It is used with the CreateProcess, CreateProcessAsUser,
/// CreateProcessWithLogonW, or CreateProcessWithTokenW function.
///
/// {@category Struct}
class PROCESS_INFORMATION extends Struct {
  @IntPtr()
  external int hProcess;
  @IntPtr()
  external int hThread;
  @Uint32()
  external int dwProcessId;
  @Uint32()
  external int dwThreadId;
}

/// The SECURITY_ATTRIBUTES structure contains the security descriptor for
/// an object and specifies whether the handle retrieved by specifying this
/// structure is inheritable.\n\nThis structure provides security settings
/// for objects created by various functions, such as CreateFile,
/// CreatePipe, CreateProcess, RegCreateKeyEx, or RegSaveKeyEx.
///
/// {@category Struct}
class SECURITY_ATTRIBUTES extends Struct {
  @Uint32()
  external int nLength;
  external Pointer lpSecurityDescriptor;
  @Int32()
  external int bInheritHandle;
}

/// Identifies an authentication service that a server is willing to use to
/// communicate to a client.
///
/// {@category Struct}
class SOLE_AUTHENTICATION_SERVICE extends Struct {
  @Uint32()
  external int dwAuthnSvc;
  @Uint32()
  external int dwAuthzSvc;
  external Pointer<Utf16> pPrincipalName;
  @Int32()
  external int hr;
}

/// Specifies the window station, desktop, standard handles, and appearance
/// of the main window for a process at creation time.
///
/// {@category Struct}
class STARTUPINFO extends Struct {
  @Uint32()
  external int cb;
  external Pointer<Utf16> lpReserved;
  external Pointer<Utf16> lpDesktop;
  external Pointer<Utf16> lpTitle;
  @Uint32()
  external int dwX;
  @Uint32()
  external int dwY;
  @Uint32()
  external int dwXSize;
  @Uint32()
  external int dwYSize;
  @Uint32()
  external int dwXCountChars;
  @Uint32()
  external int dwYCountChars;
  @Uint32()
  external int dwFillAttribute;
  @Uint32()
  external int dwFlags;
  @Uint16()
  external int wShowWindow;
  @Uint16()
  external int cbReserved2;
  external Pointer<Uint8> lpReserved2;
  @IntPtr()
  external int hStdInput;
  @IntPtr()
  external int hStdOutput;
  @IntPtr()
  external int hStdError;
}

/// Contains information about the power status of the system.
///
/// {@category Struct}
class SYSTEM_POWER_STATUS extends Struct {
  @Uint8()
  external int ACLineStatus;
  @Uint8()
  external int BatteryFlag;
  @Uint8()
  external int BatteryLifePercent;
  @Uint8()
  external int SystemStatusFlag;
  @Uint32()
  external int BatteryLifeTime;
  @Uint32()
  external int BatteryFullLifeTime;
}

/// Contains extended parameters for the TrackPopupMenuEx function.
///
/// {@category Struct}
class TPMPARAMS extends Struct {
  @Uint32()
  external int cbSize;
  external RECT rcExclude;
}

/// Contains information about a registry value. The RegQueryMultipleValues
/// function uses this structure.
///
/// {@category Struct}
class VALENT extends Struct {
  external Pointer<Utf16> ve_valuename;
  @Uint32()
  external int ve_valuelen;
  @IntPtr()
  external int ve_valueptr;
  @Uint32()
  external int ve_type;
}

/// Contains version information for a file. This information is language
/// and code page independent.
///
/// {@category Struct}
class VS_FIXEDFILEINFO extends Struct {
  @Uint32()
  external int dwSignature;
  @Uint32()
  external int dwStrucVersion;
  @Uint32()
  external int dwFileVersionMS;
  @Uint32()
  external int dwFileVersionLS;
  @Uint32()
  external int dwProductVersionMS;
  @Uint32()
  external int dwProductVersionLS;
  @Uint32()
  external int dwFileFlagsMask;
  @Uint32()
  external int dwFileFlags;
  @Uint32()
  external int dwFileOS;
  @Uint32()
  external int dwFileType;
  @Uint32()
  external int dwFileSubtype;
  @Uint32()
  external int dwFileDateMS;
  @Uint32()
  external int dwFileDateLS;
}

/// The WAVEHDR structure defines the header used to identify a
/// waveform-audio buffer.
///
/// {@category Struct}
class WAVEHDR extends Struct {
  external Pointer<Utf8> lpData;
  @Uint32()
  external int dwBufferLength;
  @Uint32()
  external int dwBytesRecorded;
  @IntPtr()
  external int dwUser;
  @Uint32()
  external int dwFlags;
  @Uint32()
  external int dwLoops;
  external Pointer<WAVEHDR> lpNext;
  @IntPtr()
  external int reserved;
}