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

  List<LibraryLink> get links => _libraryLinks[this]!;
}

final Map<LibraryLinkGroup, List<LibraryLink>> _libraryLinks = {
  LibraryLinkGroup.layout: [
    LibraryLink((localization) => localization.library_layout_sliverView, iconDataSliverView, routeLibrarySliverView),
  ],
  LibraryLinkGroup.widgets: [
    LibraryLink((localization) => localization.library_widgets_buttons, iconDataButtons, routeLibraryButtons),
    LibraryLink((localization) => localization.library_widgets_cards, iconDataCards, routeLibraryCards),
    LibraryLink((localization) => localization.library_widgets_rich_text, iconDataRichText, routeLibraryRichText),
    LibraryLink((localization) => localization.library_widgets_utilityWidgets, iconDataUtilityWidgets, routeLibraryUtilityWidgets),
  ],
};
