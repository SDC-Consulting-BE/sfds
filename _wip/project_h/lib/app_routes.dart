import "package:go_router/go_router.dart";
import "package:project_h/app/project_h/home_screen.dart";

const _subRouteHome = "/";

final router = GoRouter(
  initialLocation: _subRouteHome,
  routes: [
    GoRoute(path: _subRouteHome, builder: (_, _) => const HomeScreen()),
  ],
);
