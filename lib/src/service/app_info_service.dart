import "package:package_info_plus/package_info_plus.dart";
import "package:sfds/config.dart";

class SteveAppInfoService implements SteveAppConfigItem {
  static late final PackageInfo _appInfo;

  @override
  Future<void> configure() async {
    _appInfo = await PackageInfo.fromPlatform();
  }

  static String get appName => _appInfo.appName;

  static String get packageName => _appInfo.packageName;

  static String get version => _appInfo.version;

}
