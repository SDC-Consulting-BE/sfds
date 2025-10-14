import "package:project_h/app/_model/home_screen_link.dart";
import "package:project_h/app_constants.dart";
import "package:project_h/app_routes.dart";

final List<HomeScreenLink> homeScreenLinks = [
  HomeScreenLink(titleExtractor: (localization) => localization.dashboard, icon: iconDataDashboard, routerLink: routeDashboard),
  HomeScreenLink(titleExtractor: (localization) => localization.overview, icon: iconDataOverview, routerLink: routeOverview),
];
