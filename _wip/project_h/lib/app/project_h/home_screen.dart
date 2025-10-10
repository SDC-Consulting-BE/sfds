import "package:flutter/material.dart";
import "package:project_h/l10n/generated/app_localizations.dart";
import "package:sfds/widget.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    var theme = Theme.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.title,
        actions: const [
          SteveSliverViewAppBarActionLocaleSwitcher(supportedLocales: Localization.supportedLocales),
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        SteveSliverText(
          text: "Future content here!",
          textStyle: theme.textTheme.headlineLarge,
        ),
      ],
    );
  }
}
