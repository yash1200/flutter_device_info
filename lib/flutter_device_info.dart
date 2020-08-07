import 'dart:async';

import 'package:flutter/services.dart';

import 'models/LinuxDeviceInfo.dart';

class FlutterDeviceInfo {
  /// Channel used to communicate to native code.
  static const MethodChannel _channel =
      const MethodChannel('flutter_device_info');

  /// This information does not change from call to call. Cache it.
  LinuxDeviceInfo _cachedLinuxDeviceInfo;

  /// Parsed information from /proc/meminfo, lspci and hostnamectl
  Future<LinuxDeviceInfo> get linuxInfo async =>
      _cachedLinuxDeviceInfo ??= LinuxDeviceInfo.fromMap(
          await _channel.invokeMapMethod<String, dynamic>('linuxInfo'));
}
