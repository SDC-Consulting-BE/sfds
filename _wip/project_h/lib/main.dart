import "package:project_h/app_color_scheme.dart";
import "package:project_h/app_firebase_options.dart";
import "package:project_h/app_routes.dart";
import "package:project_h/l10n/generated/app_localizations.dart";
import "package:sfds/config.dart";

void main() async {
  SteveAppConfigurator(
      title: (context) => Localization.of(context).title,
      lightColorScheme: lightColorScheme,
      darkColorScheme: darkColorScheme,
      router: (ref) => ref.watch(goRouterProvider),
      delegates: Localization.localizationsDelegates,
      locales: Localization.supportedLocales,
    )
    ..withFirebase(firebaseOptions)
    ..start();
}
