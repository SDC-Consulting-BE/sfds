import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class RichTextLibraryScreen extends StatelessWidget {
  const RichTextLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_rich_text,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "SteveTextSpanHyperlink",
          type: SteveSliverTitleType.subtitle,
        ),
        SteveSliverRichText(
          inlineSpans: [
            SteveTextSpanHyperlink(
              text: "Hyperlink",
              url: "https://github.com/SDC-Consulting-BE/sfds",
              context: context,
            ),
          ],
        ),
      ],
    );
  }
}
