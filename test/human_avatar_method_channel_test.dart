import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:human_avatar/human_avatar_method_channel.dart';

void main() {
  MethodChannelHumanAvatar platform = MethodChannelHumanAvatar();
  const MethodChannel channel = MethodChannel('human_avatar');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
