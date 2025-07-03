import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_web_plugins/flutter_web_plugins.dart";
import "package:sfds/service.dart";

class SteveAppConfigurator {
  SteveAppConfigurator(this.app);

  final Widget app;
  final List<SteveAppConfigItem> _configItems = [
    SteveLocalStorageService(),
    SteveAppInfoService(),
  ];

  void withAppService(SteveAppConfigItem appService) {
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

abstract interface class SteveAppConfigItem {
  Future<void> configure();
}
