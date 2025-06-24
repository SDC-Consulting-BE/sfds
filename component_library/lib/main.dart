import "package:component_library/app/home_screen.dart";
import "package:component_library/app_color_scheme.dart";
import "package:flutter/material.dart";
import "package:sfds/theme.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "SFDS Component Library",
    themeMode: ThemeMode.system,
    theme: theme(light()),
    darkTheme: theme(dark()),
    home: const HomeScreen(),
  );
}
