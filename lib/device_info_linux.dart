import 'dart:async';

import 'package:flutter/services.dart';

import 'models/LinuxDeviceInfo.dart';

class DeviceInfoLinux {
  /// Channel used to communicate to native code.
  static const MethodChannel _channel =
      const MethodChannel('device_info_linux');

  /// This information does not change from call to call. Cache it.
  LinuxDeviceInfo _cachedLinuxDeviceInfo;

  Future<LinuxDeviceInfo> get linuxInfo async =>
      _cachedLinuxDeviceInfo ??= LinuxDeviceInfo.fromMap(
          await _channel.invokeMapMethod<String, dynamic>('linuxInfo'));
}
