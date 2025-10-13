import "package:component_library/app/library/layout/sliver_view_screen.dart";
import "package:component_library/app/library/library_screen.dart";
import "package:component_library/app/library/widgets/buttons_screen.dart";
import "package:component_library/app/library/widgets/cards_screen.dart";
import "package:component_library/app/library/widgets/form_elements_screen.dart";
import "package:component_library/app/library/widgets/rich_text_screen.dart";
import "package:component_library/app/library/widgets/text_screen.dart";
import "package:component_library/app/library/widgets/text_style_screen.dart";
import "package:component_library/app/library/widgets/utility_widgets_screen.dart";
import "package:go_router/go_router.dart";

const _subRouteHome = "/";
const _subRouteLibrary = "/library";
// Layout subroutes
const _subRouteSliverView = "/sliver_view";
// Widget subroutes
const _subRouteButtons = "/buttons";
const _subRouteCards = "/cards";
const _subRouteFormElements = "/form_elements";
const _subRouteRichText = "/rich_text";
const _subRouteText = "/text";
const _subRouteTextStyle = "/text_style";
const _subRouteUtilityWidgets = "/utility_widgets";

const routeLibrary = _subRouteLibrary;
// Layout routes
const routeLibrarySliverView = "$_subRouteLibrary$_subRouteSliverView";
// Widget routes
const routeLibraryButtons = "$_subRouteLibrary$_subRouteButtons";
const routeLibraryCards = "$_subRouteLibrary$_subRouteCards";
const routeLibraryFormElements = "$_subRouteLibrary$_subRouteFormElements";
const routeLibraryRichText = "$_subRouteLibrary$_subRouteRichText";
const routeLibraryText = "$_subRouteLibrary$_subRouteText";
const routeLibraryTextStyle = "$_subRouteLibrary$_subRouteTextStyle";
const routeLibraryUtilityWidgets = "$_subRouteLibrary$_subRouteUtilityWidgets";

final router = GoRouter(
  initialLocation: _subRouteHome,
  routes: [
    GoRoute(path: _subRouteHome, redirect: (_, _) => _subRouteLibrary),
    GoRoute(
      path: _subRouteLibrary,
      builder: (_, _) => const LibraryScreen(),
      routes: [
        // Layout GoRoutes
        GoRoute(path: _subRouteSliverView, builder: (_, _) => const SliverViewLibraryScreen()),
        // Widget GoRoutes
        GoRoute(path: _subRouteButtons, builder: (_, _) => const ButtonsLibraryScreen()),
        GoRoute(path: _subRouteCards, builder: (_, _) => const CardsLibraryScreen()),
        GoRoute(path: _subRouteFormElements, builder: (_, _) => const FormElementsLibraryScreen()),
        GoRoute(path: _subRouteRichText, builder: (_, _) => const RichTextLibraryScreen()),
        GoRoute(path: _subRouteText, builder: (_, _) => const TextLibraryScreen()),
        GoRoute(path: _subRouteTextStyle, builder: (_, _) => const TextStyleLibraryScreen()),
        GoRoute(path: _subRouteUtilityWidgets, builder: (_, _) => const UtilityWidgetsLibraryScreen()),
      ],
    ),
  ],
);
