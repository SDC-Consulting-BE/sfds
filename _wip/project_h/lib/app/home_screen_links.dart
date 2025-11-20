import "package:flutter/material.dart";
import "package:project_h/app_constants.dart";
import "package:project_h/app_routes.dart";
import "package:project_h/l10n/generated/app_localizations.dart";

final List<HomeScreenLink> homeScreenLinks = [
  HomeScreenLink(titleExtractor: (localization) => localization.dashboard, icon: iconDataDashboard, routerLink: routeDashboard),
  HomeScreenLink(titleExtractor: (localization) => localization.overview, icon: iconDataOverview, routerLink: routeOverview),
];

class HomeScreenLink {
  const HomeScreenLink({
    required this.titleExtractor,
    required this.icon,
    required this.routerLink,
  });

  final String Function(Localization) titleExtractor;
  final IconData icon;
  final String routerLink;
}
