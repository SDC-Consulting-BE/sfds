import "package:component_library/app_color_scheme.dart";
import "package:component_library/app_routes.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
import "package:sfds/config.dart";

void main() async {
  SteveAppConfigurator(
    () => SteveApp(
      appTitle: (context) => Localization.of(context).title,
      theme: const SteveAppTheme(
        light: lightColorScheme,
        dark: darkColorScheme,
      ),
      routing: SteveAppRouting(
        router: router,
      ),
      i18n: const SteveAppI18n(
        delegates: Localization.localizationsDelegates,
        locales: Localization.supportedLocales,
      ),
    ),
  ).start();
}
