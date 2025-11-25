import "package:component_library/app_color_scheme.dart";
import "package:component_library/app_routes.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
import "package:sfds/config.dart";

void main() async {
  SteveAppConfigurator(
    title: (context) => Localization.of(context).title,
    lightColorScheme: lightColorScheme,
    darkColorScheme: darkColorScheme,
    router: (_) => router,
    delegates: Localization.localizationsDelegates,
    locales: Localization.supportedLocales,
  ).start();
}
