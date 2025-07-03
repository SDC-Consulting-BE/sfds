import "package:component_library/app_color_scheme.dart";
import "package:component_library/app_constants.dart";
import "package:component_library/app_routes.dart";
import "package:flutter/material.dart";
import "package:sfds/config.dart";
import "package:sfds/theme.dart";

void main() async {
  AppConfigurator(const MyApp()) //
      .start();
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: appTitle,
    themeMode: ThemeMode.system,
    theme: theme(light()),
    darkTheme: theme(dark()),
    routerConfig: router,
  );
}
