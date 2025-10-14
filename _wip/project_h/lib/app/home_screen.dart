import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:project_h/app/home_screen_links.dart";
import "package:project_h/app_constants.dart";
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
          children: homeScreenLinks
              .map(
                (link) => _HomeScreenNavigationCard(
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

class _HomeScreenNavigationCard extends StatelessWidget {
  const _HomeScreenNavigationCard({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) => SteveCard(
    onTap: () => context.go(route),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        sizedBoxW8,
        Text(title),
      ],
    ),
  );
}
