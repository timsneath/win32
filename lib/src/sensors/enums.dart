/// {@category Enum}
class SensorState {
  static const SENSOR_STATE_MIN = 0x00000000;
  static const SENSOR_STATE_READY = 0x00000000;
  static const SENSOR_STATE_NOT_AVAILABLE = 0x00000001;
  static const SENSOR_STATE_NO_DATA = 0x00000002;
  static const SENSOR_STATE_INITIALIZING = 0x00000003;
  static const SENSOR_STATE_ACCESS_DENIED = 0x00000004;
  static const SENSOR_STATE_ERROR = 0x00000005;
  static const SENSOR_STATE_MAX = 0x00000005;
}

/// {@category Enum}
class SensorConnectionType {
  static const SENSOR_CONNECTION_TYPE_PC_INTEGRATED = 0x00000000;
  static const SENSOR_CONNECTION_TYPE_PC_ATTACHED = 0x00000001;
  static const SENSOR_CONNECTION_TYPE_PC_EXTERNAL = 0x00000002;
}

/// {@category Enum}
class LOCATION_DESIRED_ACCURACY {
  static const LOCATION_DESIRED_ACCURACY_DEFAULT = 0x00000000;
  static const LOCATION_DESIRED_ACCURACY_HIGH = 0x00000001;
}

/// {@category Enum}
class LOCATION_POSITION_SOURCE {
  static const LOCATION_POSITION_SOURCE_CELLULAR = 0x00000000;
  static const LOCATION_POSITION_SOURCE_SATELLITE = 0x00000001;
  static const LOCATION_POSITION_SOURCE_WIFI = 0x00000002;
  static const LOCATION_POSITION_SOURCE_IPADDRESS = 0x00000003;
  static const LOCATION_POSITION_SOURCE_UNKNOWN = 0x00000004;
}

/// {@category Enum}
class SimpleDeviceOrientation {
  static const SIMPLE_DEVICE_ORIENTATION_NOT_ROTATED = 0x00000000;
  static const SIMPLE_DEVICE_ORIENTATION_ROTATED_90 = 0x00000001;
  static const SIMPLE_DEVICE_ORIENTATION_ROTATED_180 = 0x00000002;
  static const SIMPLE_DEVICE_ORIENTATION_ROTATED_270 = 0x00000003;
  static const SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_UP = 0x00000004;
  static const SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_DOWN = 0x00000005;
}

/// {@category Enum}
class MagnetometerAccuracy {
  static const MAGNETOMETER_ACCURACY_UNKNOWN = 0x00000000;
  static const MAGNETOMETER_ACCURACY_UNRELIABLE = 0x00000001;
  static const MAGNETOMETER_ACCURACY_APPROXIMATE = 0x00000002;
  static const MAGNETOMETER_ACCURACY_HIGH = 0x00000003;
}
