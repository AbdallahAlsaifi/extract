import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'extract_method_channel.dart';

abstract class ExtractPlatform extends PlatformInterface {
  /// Constructs a ExtractPlatform.
  ExtractPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExtractPlatform _instance = MethodChannelExtract();

  /// The default instance of [ExtractPlatform] to use.
  ///
  /// Defaults to [MethodChannelExtract].
  static ExtractPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExtractPlatform] when
  /// they register themselves.
  static set instance(ExtractPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
