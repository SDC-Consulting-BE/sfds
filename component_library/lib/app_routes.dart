import "package:component_library/app/library/layout/sliver_view_screen.dart";
import "package:component_library/app/library/library_screen.dart";
import "package:component_library/app/library/widgets/buttons_screen.dart";
import "package:component_library/app/library/widgets/cards_screen.dart";
import "package:component_library/app/library/widgets/rich_text_screen.dart";
import "package:component_library/app/library/widgets/utility_widgets_screen.dart";
import "package:go_router/go_router.dart";

const _subRouteHome = "/";
const _subRouteLibrary = "/library";
const _subRouteSliverView = "/sliver_view";
const _subRouteButtons = "/buttons";
const _subRouteCards = "/cards";
const _subRouteRichText = "/rich_text";
const _subRouteUtilityWidgets = "/utility_widgets";

const routeLibrary = _subRouteLibrary;
const routeLibrarySliverView = "$_subRouteLibrary$_subRouteSliverView";
const routeLibraryButtons = "$_subRouteLibrary$_subRouteButtons";
const routeLibraryCards = "$_subRouteLibrary$_subRouteCards";
const routeLibraryRichText = "$_subRouteLibrary$_subRouteRichText";
const routeLibraryUtilityWidgets = "$_subRouteLibrary$_subRouteUtilityWidgets";

final router = GoRouter(
  initialLocation: _subRouteHome,
  routes: [
    GoRoute(path: _subRouteHome, redirect: (_, _) => _subRouteLibrary),
    GoRoute(
      path: _subRouteLibrary,
      builder: (_, _) => const LibraryScreen(),
      routes: [
        GoRoute(path: _subRouteSliverView, builder: (_, _) => const SliverViewLibraryScreen()),
        GoRoute(path: _subRouteButtons, builder: (_, _) => const ButtonLibraryScreen()),
        GoRoute(path: _subRouteCards, builder: (_, _) => const CardLibraryScreen()),
        GoRoute(path: _subRouteRichText, builder: (_, _) => const RichTextScreen()),
        GoRoute(path: _subRouteUtilityWidgets, builder: (_, _) => const UtilityWidgetsLibraryScreen()),
      ],
    ),
  ],
);
