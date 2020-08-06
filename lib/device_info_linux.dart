import 'dart:async';

import 'package:flutter/services.dart';

import 'models/LinuxDeviceInfo.dart';

class DeviceInfoLinux {
  static const MethodChannel _channel =
      const MethodChannel('device_info_linux');

  LinuxDeviceInfo _cachedLinuxDeviceInfo;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<LinuxDeviceInfo> get linuxInfo async =>
      _cachedLinuxDeviceInfo ??= LinuxDeviceInfo.fromMap(
          await _channel.invokeMapMethod<String, dynamic>('linuxInfo'));
}
