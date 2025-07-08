import "package:component_library/app_color_scheme.dart";
import "package:component_library/app_constants.dart";
import "package:component_library/app_routes.dart";
import "package:sfds/config.dart";

void main() async {
  SteveAppConfigurator(
    () => SteveApp(
      appTitle: appTitle,
      lightColorScheme: lightColorScheme,
      darkColorScheme: darkColorScheme,
      router: router,
    ),
  ).start();
}
