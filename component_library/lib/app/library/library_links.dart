import "package:component_library/app/library/widget/library_link_section.dart";
import "package:component_library/app_constants.dart";
import "package:component_library/app_routes.dart";

enum LibraryLinkGroup {
  layout,
  widgets,
}

extension LibraryLinkGroupLabel on LibraryLinkGroup {
  String get label => switch (this) {
    LibraryLinkGroup.layout => "Layout",
    LibraryLinkGroup.widgets => "Widgets",
  };

  List<LibraryLink> get links => _libraryLinks[this]!;
}

const Map<LibraryLinkGroup, List<LibraryLink>> _libraryLinks = {
  LibraryLinkGroup.layout: [
    LibraryLink("Sliver View", iconDataSliverView, routeLibrarySliverView),
  ],
  LibraryLinkGroup.widgets: [
    LibraryLink("Buttons", iconDataButtons, routeLibraryButtons),
    LibraryLink("Cards", iconDataCards, routeLibraryCards),
  ],
};
