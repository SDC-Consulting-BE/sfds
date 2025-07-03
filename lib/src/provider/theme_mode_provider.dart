import "dart:async";

import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sfds/service.dart";

part "theme_mode_provider.g.dart";

@riverpod
class SteveThemeMode extends _$SteveThemeMode {
  static const _KEY_THEME_MODE = "steveThemeMode";

  @override
  ThemeMode build() {
    var storedThemeMode = SteveLocalStorageService.readString(_KEY_THEME_MODE);
    return storedThemeMode != null
        ? ThemeMode.values.byName(storedThemeMode) //
        : ThemeMode.light;
  }

  void flipThemeMode() {
    state = state.flipped;
    unawaited(SteveLocalStorageService.writeString(_KEY_THEME_MODE, state.name));
  }
}

extension _ThemeModeFlipper on ThemeMode {
  ThemeMode get flipped => switch (this) {
    ThemeMode.light => ThemeMode.dark,
    ThemeMode.dark => ThemeMode.light,
    _ => throw UnsupportedError("ThemeMode system is not supported (and should not be possible)"),
  };
}
