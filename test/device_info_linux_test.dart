import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_info_linux/device_info_linux.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_info_linux');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DeviceInfoLinux.platformVersion, '42');
  });
}
