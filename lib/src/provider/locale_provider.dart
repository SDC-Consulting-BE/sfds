import "dart:async";
import "dart:ui";

import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sfds/service.dart";

part "locale_provider.g.dart";

@riverpod
class SteveLocale extends _$SteveLocale {
  static const _KEY_STEVE_LOCALE = "steveLanguageCode";

  @override
  Locale? build() {
    var storedLanguageCode = SteveLocalStorageService.readString(_KEY_STEVE_LOCALE);
    return storedLanguageCode != null ? Locale(storedLanguageCode) : null;
  }

  void selectLocale(Locale locale) {
    if (state == locale) {
      return;
    }
    state = locale;
    unawaited(SteveLocalStorageService.writeString(_KEY_STEVE_LOCALE, locale.languageCode));
  }
}
