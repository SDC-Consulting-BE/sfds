import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:sfds/service.dart";
import "package:sfds/src/config/app.dart";

class SteveAppConfigurator {
  SteveAppConfigurator({
    required this.title,
    required this.lightColorScheme,
    required this.darkColorScheme,
    required this.router,
    required this.delegates,
    required this.locales,
  });

  final List<SteveAppConfigItem> _configItems = [
    SteveLocalStorageService(),
    SteveAppInfoService(),
  ];

  final String Function(BuildContext) title;
  final ColorScheme lightColorScheme;
  final ColorScheme darkColorScheme;
  final GoRouter router;
  final List<LocalizationsDelegate<dynamic>> delegates;
  final List<Locale> locales;

  void withAppService(SteveAppConfigItem appService) {
    _configItems.add(appService);
  }

  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.forEach(_configItems, (configItem) async => configItem.configure());
    _runApp();
  }

  void _runApp() => runApp(
    ProviderScope(
      child: SteveApp(
        appTitle: title,
        lightColorScheme: lightColorScheme,
        darkColorScheme: darkColorScheme,
        router: router,
        delegates: delegates,
        locales: locales,
      ),
    ),
  );
}

abstract interface class SteveAppConfigItem {
  Future<void> configure();
}
