import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class TextLibraryScreen extends StatelessWidget {
  const TextLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    var theme = Theme.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_text,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "SteveCenteredText",
          type: SteveSliverTitleType.subtitle,
        ),
        SteveSliverText(
          text: localization.library_widgets_text_centered_text,
        ),
        SteveSliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3,
          ),
          children: [
            SteveCard(
              child: SteveCenteredText(
                text: "SteveCenteredText",
                textStyle: theme.textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
