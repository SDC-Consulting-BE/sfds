import "package:flutter/material.dart";
import "package:project_h/app/_widget/home_screen_navigation_card.dart";
import "package:project_h/app/home_screen_links.dart";
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
          // SteveSliverViewAppBarActionLocaleSwitcher(supportedLocales: Localization.supportedLocales),
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
          children: homeScreenLinks
              .map(
                (link) => HomeScreenNavigationCard(
                  title: link.titleExtractor.call(localization),
                  icon: link.icon,
                  route: link.routerLink,
                ),
              ) //
              .toList(),
        ),
      ],
    );
  }
}
