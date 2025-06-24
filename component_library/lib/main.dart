import "package:component_library/app_color_scheme.dart";
import "package:component_library/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_web_plugins/flutter_web_plugins.dart";
import "package:sfds/theme.dart";

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: "SFDS Component Library",
    themeMode: ThemeMode.system,
    theme: theme(light()),
    darkTheme: theme(dark()),
    routerConfig: router,
  );
}
