import "package:component_library/app_color_scheme.dart";
import "package:component_library/app_constants.dart";
import "package:component_library/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:sfds/config.dart";
import "package:sfds/provider.dart";
import "package:sfds/theme.dart";

void main() async {
  AppConfigurator(const MyApp()) //
      .start();
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(steveThemeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: themeMode,
      theme: theme(light()),
      darkTheme: theme(dark()),
      routerConfig: router,
    );
  }
}
