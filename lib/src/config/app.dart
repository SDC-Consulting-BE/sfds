import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:sfds/provider.dart";
import "package:sfds/src/provider/locale_provider.dart";
import "package:sfds/theme.dart";

class SteveApp extends ConsumerWidget {
  const SteveApp({
    required this.appTitle,
    required this.lightColorScheme,
    required this.darkColorScheme,
    required this.router,
    required this.delegates,
    required this.locales,
  });

  final String Function(BuildContext context) appTitle;
  final ColorScheme lightColorScheme;
  final ColorScheme darkColorScheme;
  final GoRouter router;
  final Iterable<LocalizationsDelegate> delegates;
  final Iterable<Locale> locales;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(steveThemeModeProvider);
    var locale = ref.watch(steveLocaleProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: appTitle,
      themeMode: themeMode,
      theme: themeData(lightColorScheme),
      darkTheme: themeData(darkColorScheme),
      routerConfig: router,
      localizationsDelegates: delegates,
      supportedLocales: locales,
      locale: locale,
    );
  }
}
