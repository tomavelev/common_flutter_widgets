import 'default_platform.dart'
    if (dart.library.html) 'web_default_platform.dart';
import 'platform_wrapper.dart';


PlatformWrapper platform() => getPlatform();

bool isApple() => isApplePlatform();

