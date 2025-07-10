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

  void cycleLocale() {
    state = (state != null ? state!.cycled : const Locale("en"));
    unawaited(SteveLocalStorageService.writeString(_KEY_STEVE_LOCALE, state!.languageCode));
  }
}

extension _LocaleCycler on Locale {
  Locale get cycled => switch(languageCode) {
    "de" => const Locale("en"),
    "en" => const Locale("fr"),
    "fr" => const Locale("nl"),
    "nl" => const Locale("de"),
    _ => throw UnsupportedError("Language code $languageCode is not supported (and should not be possible)"),
  };
}
