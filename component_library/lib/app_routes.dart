import "package:component_library/app/library/button/button_library_screen.dart";
import "package:component_library/app/library/card/card_library_screen.dart";
import "package:component_library/app/library/library_screen.dart";
import "package:go_router/go_router.dart";

const routeHome = "/";

const routeLibrary = "/library";
const routeLibraryButtons = "/buttons";
const routeLibraryCards = "/cards";

final router = GoRouter(
  initialLocation: routeHome,
  routes: [
    GoRoute(path: routeHome, redirect: (_, _) => routeLibrary),
    GoRoute(
      path: routeLibrary,
      builder: (_, _) => const LibraryScreen(),
      routes: [
        GoRoute(path: routeLibraryButtons, builder: (_, _) => const ButtonLibraryScreen()),
        GoRoute(path: routeLibraryCards, builder: (_, _) => const CardLibraryScreen()),
      ],
    ),
  ],
);
