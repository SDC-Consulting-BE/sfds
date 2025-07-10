import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:sfds/provider.dart";
import "package:sfds/src/provider/locale_provider.dart";
import "package:sfds/theme.dart";

class SteveApp extends ConsumerWidget {
  const SteveApp({
    required this.appTitle,
    required this.theme,
    required this.routing,
    required this.i18n,
  });

  final String Function(BuildContext context) appTitle;
  final SteveAppTheme theme;
  final SteveAppRouting routing;
  final SteveAppI18n i18n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(steveThemeModeProvider);
    var locale = ref.watch(steveLocaleProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: appTitle,
      themeMode: themeMode,
      theme: themeData(theme.light),
      darkTheme: themeData(theme.dark),
      routerConfig: routing.router,
      localizationsDelegates: i18n.delegates,
      supportedLocales: i18n.locales,
      locale: locale,
    );
  }
}

class SteveAppTheme {
  const SteveAppTheme({
    required this.light,
    required this.dark,
  });

  final ColorScheme light;
  final ColorScheme dark;
}

class SteveAppRouting {
  const SteveAppRouting({
    required this.router,
  });

  final GoRouter router;
}

class SteveAppI18n {
  const SteveAppI18n({
    required this.delegates,
    required this.locales,
  });

  final Iterable<LocalizationsDelegate> delegates;
  final Iterable<Locale> locales;
}
