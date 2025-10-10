import "package:go_router/go_router.dart";
import "package:project_h/app/dashboard/dashboard_screen.dart";
import "package:project_h/app/home_screen.dart";

const _subRouteHome = "/";
const _subRouteDashboard = "/dashboard";

final router = GoRouter(
  initialLocation: _subRouteDashboard,
  routes: [
    GoRoute(
      path: _subRouteHome,
      builder: (_, _) => const HomeScreen(),
      routes: [
        GoRoute(path: _subRouteDashboard, builder: (_, _) => const DashboardScreen()),
      ],
    ),
  ],
);
