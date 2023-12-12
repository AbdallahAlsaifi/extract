import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'extract_platform_interface.dart';

/// An implementation of [ExtractPlatform] that uses method channels.
class MethodChannelExtract extends ExtractPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('extract');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
