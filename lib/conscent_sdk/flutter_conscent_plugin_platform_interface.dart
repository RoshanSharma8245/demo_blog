import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_conscent_plugin_method_channel.dart';

abstract class FlutterConscentPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterConscentPluginPlatform.
  FlutterConscentPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterConscentPluginPlatform _instance = MethodChannelFlutterConscentPlugin();

  /// The default instance of [FlutterConscentPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterConscentPlugin].
  static FlutterConscentPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterConscentPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterConscentPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
