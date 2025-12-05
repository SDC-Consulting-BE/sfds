import "package:component_library/app/library/_widget/library_link_section.dart";
import "package:component_library/app_constants.dart";
import "package:component_library/app_routes.dart";
import "package:component_library/l10n/generated/app_localizations.dart";

enum LibraryLinkGroup {
  design,
  layout,
  widgets,
}

extension LibraryLinkGroupLabel on LibraryLinkGroup {
  String Function(Localization) get label => switch (this) {
    .design => (localization) => localization.library_design,
    .layout => (localization) => localization.library_layout,
    .widgets => (localization) => localization.library_widgets,
  };

  List<LibraryLink> get links => _libraryLinks[this]!;
}

final Map<LibraryLinkGroup, List<LibraryLink>> _libraryLinks = {
  .design: [
    LibraryLink((localization) => localization.library_design_text_style, iconDataTextStyle, routeLibraryTextStyle),
  ],
  .layout: [
    LibraryLink((localization) => localization.library_layout_sliverView, iconDataSliverView, routeLibrarySliverView),
  ],
  .widgets: [
    LibraryLink((localization) => localization.library_widgets_buttons, iconDataButtons, routeLibraryButtons),
    LibraryLink((localization) => localization.library_widgets_cards, iconDataCards, routeLibraryCards),
    LibraryLink((localization) => localization.library_widgets_form_elements, iconDataFormElements, routeLibraryFormElements),
    LibraryLink((localization) => localization.library_widgets_icons, iconDataIcons, routeLibraryIcons),
    LibraryLink((localization) => localization.library_widgets_rich_text, iconDataRichText, routeLibraryRichText),
    LibraryLink((localization) => localization.library_widgets_shimmer, iconDataShimmer, routeLibraryShimmer),
    LibraryLink((localization) => localization.library_widgets_text, iconDataText, routeLibraryText),
    LibraryLink((localization) => localization.library_widgets_toasts, iconDataToasts, routeLibraryToasts),
    LibraryLink((localization) => localization.library_widgets_utility_widgets, iconDataUtilityWidgets, routeLibraryUtilityWidgets),
  ],
};
