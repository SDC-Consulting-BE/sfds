import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:project_h/app/_provider/app_startup_provider.dart";
import "package:project_h/app/dashboard/dashboard_screen.dart";
import "package:project_h/app/error/error_screen.dart";
import "package:project_h/app/home_screen.dart";
import "package:project_h/app/loading/loading_screen.dart";
import "package:project_h/app/overview/overview_screen.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "app_routes.g.dart";

const _subRouteLoading = "/";
const _subRouteError = "/error";
const _subRouteHome = "/home";
const _subRouteDashboard = "/dashboard";
const _subRouteOverview = "/overview";

const routeDashboard = _subRouteDashboard;
const routeOverview = _subRouteOverview;

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  var startupState = ref.watch(appStartupProvider);
  return GoRouter(
    initialLocation: _subRouteDashboard,
    redirect: (context, state) => _redirect(context, state, startupState),
    routes: [
      GoRoute(
        path: _subRouteLoading,
        builder: (_, _) => const LoadingScreen(),
        routes: [
          GoRoute(path: _subRouteError, builder: (_, _) => const ErrorScreen()),
          GoRoute(path: _subRouteHome, builder: (_, _) => const HomeScreen()),
          GoRoute(path: _subRouteDashboard, builder: (_, _) => const DashboardScreen()),
          GoRoute(path: _subRouteOverview, builder: (_, _) => const OverviewScreen()),
        ],
      ),
    ],
  );
}

FutureOr<String?> _redirect(BuildContext context, GoRouterState routerState, AsyncValue<AppStartupState> startupState) {
  var location = routerState.uri.toString();
  var isGoingToLoading = location == _subRouteLoading;

  if (startupState.isLoading) {
    return isGoingToLoading ? null : _subRouteLoading;
  }

  if (startupState.hasValue && startupState.value == AppStartupState.dataReady) {
    if (isGoingToLoading) {
      return _subRouteHome;
    }
    return null;
  }

  if (startupState.hasError) {
    return _subRouteError;
  }

  return null;
}
