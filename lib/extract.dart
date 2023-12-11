
import 'extract_platform_interface.dart';

class Extract {
  Future<String?> getPlatformVersion() {
    return ExtractPlatform.instance.getPlatformVersion();
  }
}
