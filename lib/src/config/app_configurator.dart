import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_web_plugins/flutter_web_plugins.dart";
import "package:sfds/service.dart";

class AppConfigurator {
  AppConfigurator(this.app);

  final Widget app;
  final List<AppConfigItem> _configItems = [
    LocalStorageService(),
    AppInfoService(),
  ];

  void withAppService(AppConfigItem appService) {
    _configItems.add(appService);
  }

  Future<void> start() async {
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();
    await Future.forEach(_configItems, (configItem) async => configItem.configure());
    _runApp();
  }

  void _runApp() => runApp(ProviderScope(child: app));
}

abstract interface class AppConfigItem {
  Future<void> configure();
}
