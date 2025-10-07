import "package:component_library/app/library/_widget/library_link_section.dart";
import "package:component_library/app_constants.dart";
import "package:component_library/app_routes.dart";
import "package:component_library/l10n/generated/app_localizations.dart";

enum LibraryLinkGroup {
  layout,
  widgets,
}

extension LibraryLinkGroupLabel on LibraryLinkGroup {
  String Function(Localization) get label => switch (this) {
    LibraryLinkGroup.layout => (localization) => localization.library_layout,
    LibraryLinkGroup.widgets => (localization) => localization.library_widgets,
  };

  List<LibraryLink> getLinks(Localization localization) =>
      _libraryLinks[this]! //
        ..sort((link1, link2) => link1.titleExtractor.call(localization).compareTo(link2.titleExtractor.call(localization)));
}

final Map<LibraryLinkGroup, List<LibraryLink>> _libraryLinks = {
  LibraryLinkGroup.layout: [
    LibraryLink((localization) => localization.library_layout_sliverView, iconDataSliverView, routeLibrarySliverView),
  ],
  LibraryLinkGroup.widgets: [
    LibraryLink((localization) => localization.library_widgets_buttons, iconDataButtons, routeLibraryButtons),
    LibraryLink((localization) => localization.library_widgets_cards, iconDataCards, routeLibraryCards),
    LibraryLink((localization) => localization.library_widgets_utilityWidgets, iconDataUtilityWidgets, routeLibraryUtilityWidgets),
  ],
};
