import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:project_h/l10n/generated/app_localizations.dart";
import "package:sfds/widget.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.title,
        actions: const [
          SteveSliverViewAppBarActionLocaleSwitcher(supportedLocales: Localization.supportedLocales),
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        SteveSliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 240,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3,
          ),
          children: [
            SteveCard(
              onTap: () => context.go("/dashboard"),
              child: const Center(
                child: Text("Dashboard"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
