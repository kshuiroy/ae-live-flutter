import 'dart:io';

class PlatformHelper {
  PlatformHelper._();

  static bool get isApplePlatform => Platform.isIOS || Platform.isMacOS;

  static bool get isDesktop =>
      Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}
