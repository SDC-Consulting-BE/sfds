import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_web_plugins/flutter_web_plugins.dart";
import "package:go_router/go_router.dart";
import "package:sfds/provider.dart";
import "package:sfds/service.dart";
import "package:sfds/theme.dart";

class SteveAppConfigurator {
  SteveAppConfigurator(this.appGenerator);

  final Widget Function() appGenerator;
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

  void _runApp() => runApp(ProviderScope(child: appGenerator.call()));
}

class SteveApp extends ConsumerWidget {
  const SteveApp({
    required this.appTitle,
    required this.lightColorScheme,
    required this.darkColorScheme,
    required this.router,
  });

  final String appTitle;
  final ColorScheme lightColorScheme;
  final ColorScheme darkColorScheme;
  final GoRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(steveThemeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: themeMode,
      theme: theme(lightColorScheme),
      darkTheme: theme(darkColorScheme),
      routerConfig: router,
    );
  }
}

abstract interface class SteveAppConfigItem {
  Future<void> configure();
}
