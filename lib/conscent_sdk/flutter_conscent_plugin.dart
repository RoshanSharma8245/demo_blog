
import 'flutter_conscent_plugin_platform_interface.dart';

class FlutterConscentPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterConscentPluginPlatform.instance.getPlatformVersion();
  }
}
