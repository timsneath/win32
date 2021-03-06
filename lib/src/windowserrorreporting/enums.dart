/// {@category Enum}
class WER_REPORT_UI {
  static const WerUIAdditionalDataDlgHeader = 0x00000001;
  static const WerUIIconFilePath = 0x00000002;
  static const WerUIConsentDlgHeader = 0x00000003;
  static const WerUIConsentDlgBody = 0x00000004;
  static const WerUIOnlineSolutionCheckText = 0x00000005;
  static const WerUIOfflineSolutionCheckText = 0x00000006;
  static const WerUICloseText = 0x00000007;
  static const WerUICloseDlgHeader = 0x00000008;
  static const WerUICloseDlgBody = 0x00000009;
  static const WerUICloseDlgButtonText = 0x0000000a;
  static const WerUIMax = 0x0000000b;
}

/// {@category Enum}
class WER_REGISTER_FILE_TYPE {
  static const WerRegFileTypeUserDocument = 0x00000001;
  static const WerRegFileTypeOther = 0x00000002;
  static const WerRegFileTypeMax = 0x00000003;
}

/// {@category Enum}
class WER_FILE_TYPE {
  static const WerFileTypeMicrodump = 0x00000001;
  static const WerFileTypeMinidump = 0x00000002;
  static const WerFileTypeHeapdump = 0x00000003;
  static const WerFileTypeUserDocument = 0x00000004;
  static const WerFileTypeOther = 0x00000005;
  static const WerFileTypeTriagedump = 0x00000006;
  static const WerFileTypeCustomDump = 0x00000007;
  static const WerFileTypeAuxiliaryDump = 0x00000008;
  static const WerFileTypeEtlTrace = 0x00000009;
  static const WerFileTypeMax = 0x0000000a;
}

/// {@category Enum}
class WER_SUBMIT_RESULT {
  static const WerReportQueued = 0x00000001;
  static const WerReportUploaded = 0x00000002;
  static const WerReportDebug = 0x00000003;
  static const WerReportFailed = 0x00000004;
  static const WerDisabled = 0x00000005;
  static const WerReportCancelled = 0x00000006;
  static const WerDisabledQueue = 0x00000007;
  static const WerReportAsync = 0x00000008;
  static const WerCustomAction = 0x00000009;
  static const WerThrottled = 0x0000000a;
  static const WerReportUploadedCab = 0x0000000b;
  static const WerStorageLocationNotFound = 0x0000000c;
  static const WerSubmitResultMax = 0x0000000d;
}

/// {@category Enum}
class WER_REPORT_TYPE {
  static const WerReportNonCritical = 0x00000000;
  static const WerReportCritical = 0x00000001;
  static const WerReportApplicationCrash = 0x00000002;
  static const WerReportApplicationHang = 0x00000003;
  static const WerReportKernel = 0x00000004;
  static const WerReportInvalid = 0x00000005;
}

/// {@category Enum}
class WER_CONSENT {
  static const WerConsentNotAsked = 0x00000001;
  static const WerConsentApproved = 0x00000002;
  static const WerConsentDenied = 0x00000003;
  static const WerConsentAlwaysPrompt = 0x00000004;
  static const WerConsentMax = 0x00000005;
}

/// {@category Enum}
class WER_DUMP_TYPE {
  static const WerDumpTypeNone = 0x00000000;
  static const WerDumpTypeMicroDump = 0x00000001;
  static const WerDumpTypeMiniDump = 0x00000002;
  static const WerDumpTypeHeapDump = 0x00000003;
  static const WerDumpTypeTriageDump = 0x00000004;
  static const WerDumpTypeMax = 0x00000005;
}

/// {@category Enum}
class REPORT_STORE_TYPES {
  static const E_STORE_USER_ARCHIVE = 0x00000000;
  static const E_STORE_USER_QUEUE = 0x00000001;
  static const E_STORE_MACHINE_ARCHIVE = 0x00000002;
  static const E_STORE_MACHINE_QUEUE = 0x00000003;
  static const E_STORE_INVALID = 0x00000004;
}

/// {@category Enum}
class EFaultRepRetVal {
  static const frrvOk = 0x00000000;
  static const frrvOkManifest = 0x00000001;
  static const frrvOkQueued = 0x00000002;
  static const frrvErr = 0x00000003;
  static const frrvErrNoDW = 0x00000004;
  static const frrvErrTimeout = 0x00000005;
  static const frrvLaunchDebugger = 0x00000006;
  static const frrvOkHeadless = 0x00000007;
  static const frrvErrAnotherInstance = 0x00000008;
  static const frrvErrNoMemory = 0x00000009;
  static const frrvErrDoubleFault = 0x0000000a;
}
