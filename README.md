# flutter_device_info

Get current device information from within the Flutter application.

Currently Supported devices are - Linux.

## Usage

Import `package:flutter_device_info/flutter_device_info.dart`, instantiate `FlutterDeviceInfo` and use the Linux getters to get platform-specific device information.

Example :

```dart
LinuxDeviceInfo linuxDeviceInfo = await FlutterDeviceInfo().linuxInfo;
print("OS is ${linuxDeviceInfo.os}");  // Example : Arch Linux
```
