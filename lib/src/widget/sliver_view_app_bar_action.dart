import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:sfds/provider.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/provider/locale_provider.dart";
import "package:sfds/src/widget/sliver_view.dart";

class SteveSliverViewAppBarActionThemeSwitcher extends ConsumerWidget {
  const SteveSliverViewAppBarActionThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeModeNotifier = ref.read(steveThemeModeProvider.notifier);
    var themeMode = ref.watch(steveThemeModeProvider);
    return SteveSliverViewAppBarAction(
      icon: themeMode.icon,
      onPressed: themeModeNotifier.flipThemeMode,
    );
  }
}

extension _ThemeModeIcon on ThemeMode {
  IconData get icon => switch (this) {
    .light => iconDataLightMode,
    .dark => iconDataDarkMode,
    _ => throw UnsupportedError("ThemeMode system is not supported (and should not be possible)"),
  };
}

class SteveSliverViewAppBarActionLocaleSwitcher extends ConsumerWidget {
  const SteveSliverViewAppBarActionLocaleSwitcher({
    super.key,
    required this.supportedLocales,
  });

  final List<Locale> supportedLocales;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localeNotifier = ref.read(steveLocaleProvider.notifier);
    var currentLocale = ref.watch(steveLocaleProvider) ?? Localizations.localeOf(context);
    var nonCurrentLocales = supportedLocales.where((supportedLocale) => currentLocale != supportedLocale);
    var navigator = Navigator.of(context);
    return SteveSliverViewAppBarDropDown(
      visual: Text(currentLocale.languageCode),
      items: [currentLocale, ...nonCurrentLocales].map(
        (locale) => SteveSliverViewAppBarDropDownTile(
          selected: currentLocale == locale,
          onTap: () {
            localeNotifier.selectLocale(locale);
            navigator.pop();
          },
          leading: Text(locale.languageCode),
          title: "${steveLocaleLanguageDescriptions[locale.languageCode]}",
        ),
      ),
    );
  }
}
