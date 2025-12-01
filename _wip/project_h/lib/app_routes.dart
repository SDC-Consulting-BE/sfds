import "package:go_router/go_router.dart";
import "package:project_h/app/dashboard/dashboard_screen.dart";
import "package:project_h/app/home_screen.dart";
import "package:project_h/app/overview/overview_screen.dart";

const _subRouteHome = "/";
const _subRouteDashboard = "/dashboard";
const _subRouteOverview = "/overview";

const routeDashboard = _subRouteDashboard;
const routeOverview = _subRouteOverview;

final router = GoRouter(
  initialLocation: _subRouteDashboard,
  routes: [
    GoRoute(
      path: _subRouteHome,
      builder: (_, _) => const HomeScreen(),
      routes: [
        GoRoute(path: _subRouteDashboard, builder: (_, _) => const DashboardScreen()),
        GoRoute(path: _subRouteOverview, builder: (_, _) => const OverviewScreen()),
      ],
    ),
  ],
);
