import "package:component_library/app/library/_widget/library_link_section.dart";
import "package:component_library/app/library/library_links.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.title,
        actions: const [
          SteveSliverViewAppBarActionLocaleSwitcher(supportedLocales: Localization.supportedLocales),
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        SteveSliverRichText(
          inlineSpans: [
            TextSpan(
              text: localization.description_line1_preLink,
            ),
            SteveTextSpanHyperlink(
              text: "GitHub repository",
              url: "https://github.com/SDC-Consulting-BE/sfds",
              context: context,
            ),
            TextSpan(text: localization.description_line1_postLink),
          ],
        ),
        SteveSliverText(text: localization.description_line2),
        ...LibraryLinkGroup.values
            .map((linkGroup) => _librarySection(linkGroup, localization)) //
            .fold([], (previousValue, element) => [...previousValue, ...element]),
      ],
    );
  }

  List<Widget> _librarySection(
    LibraryLinkGroup group,
    Localization localization,
  ) => [
    SteveSliverTitle(title: group.label.call(localization)),
    LibraryLinkSection(links: group.getLinks(localization)),
  ];
}
