import 'package:flutter_test/flutter_test.dart';
import 'package:extract/extract.dart';
import 'package:extract/extract_platform_interface.dart';
import 'package:extract/extract_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExtractPlatform
    with MockPlatformInterfaceMixin
    implements ExtractPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ExtractPlatform initialPlatform = ExtractPlatform.instance;

  test('$MethodChannelExtract is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExtract>());
  });

  test('getPlatformVersion', () async {
    Extract extractPlugin = Extract();
    MockExtractPlatform fakePlatform = MockExtractPlatform();
    ExtractPlatform.instance = fakePlatform;

    expect(await extractPlugin.getPlatformVersion(), '42');
  });
}
