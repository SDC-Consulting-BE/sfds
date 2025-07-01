import "package:component_library/app/library/button/button_library_screen.dart";
import "package:component_library/app/library/card/card_library_screen.dart";
import "package:component_library/app/library/library_screen.dart";
import "package:component_library/app/library/sliver_view/sliver_view_library_screen.dart";
import "package:go_router/go_router.dart";

const _subRouteHome = "/";
const _subRouteLibrary = "/library";
const _subRouteLibrarySliverView = "/sliver_view";
const _subRouteLibraryButtons = "/buttons";
const _subRouteLibraryCards = "/cards";

const routeLibrary = _subRouteLibrary;
const routeLibrarySliverView = "$_subRouteLibrary$_subRouteLibrarySliverView";
const routeLibraryButtons = "$_subRouteLibrary$_subRouteLibraryButtons";
const routeLibraryCards = "$_subRouteLibrary$_subRouteLibraryCards";

final router = GoRouter(
  initialLocation: _subRouteHome,
  routes: [
    GoRoute(path: _subRouteHome, redirect: (_, _) => _subRouteLibrary),
    GoRoute(
      path: _subRouteLibrary,
      builder: (_, _) => const LibraryScreen(),
      routes: [
        GoRoute(path: _subRouteLibrarySliverView, builder: (_, _) => const SliverViewLibraryScreen()),
        GoRoute(path: _subRouteLibraryButtons, builder: (_, _) => const ButtonLibraryScreen()),
        GoRoute(path: _subRouteLibraryCards, builder: (_, _) => const CardLibraryScreen()),
      ],
    ),
  ],
);
