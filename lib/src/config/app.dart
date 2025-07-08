import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:sfds/provider.dart";
import "package:sfds/theme.dart";

class SteveApp extends ConsumerWidget {
  const SteveApp({
    required this.appTitle,
    required this.theme,
    required this.router,
  });

  final String appTitle;
  final SteveAppTheme theme;
  final GoRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(steveThemeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: themeMode,
      theme: themeData(theme.light),
      darkTheme: themeData(theme.dark),
      routerConfig: router,
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
