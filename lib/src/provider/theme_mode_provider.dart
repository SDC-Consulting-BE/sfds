import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "theme_mode_provider.g.dart";

@riverpod
class SteveThemeMode extends _$SteveThemeMode {
  @override
  ThemeMode build() => ThemeMode.light;

  void flipThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
