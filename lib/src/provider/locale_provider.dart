import "dart:ui";

import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sfds/config.dart";
import "package:sfds/service.dart";

part "locale_provider.g.dart";

@riverpod
class SteveLocale extends _$SteveLocale {
  static const _KEY_STEVE_LOCALE = "steveLanguageCode";

  @override
  Locale build(SteveAppI18n i18n) {
    var storedLanguageCode = SteveLocalStorageService.readString(_KEY_STEVE_LOCALE);
    return storedLanguageCode != null ? Locale(storedLanguageCode) : i18n.locales.first;
  }
}
