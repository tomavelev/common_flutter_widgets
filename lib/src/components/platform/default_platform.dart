import 'dart:io';

import 'platform_wrapper.dart';

PlatformWrapper getPlatform() {
  if (Platform.isAndroid) return PlatformWrapper.android;
  if (Platform.isMacOS) return PlatformWrapper.macos;
  if (Platform.isIOS) return PlatformWrapper.ios;
  if (Platform.isLinux) return PlatformWrapper.linux;
  if (Platform.isWindows) return PlatformWrapper.windows;

  return PlatformWrapper.android;
}

bool isApplePlatform() =>
    getPlatform() == PlatformWrapper.ios ||
    getPlatform() == PlatformWrapper.macos;
