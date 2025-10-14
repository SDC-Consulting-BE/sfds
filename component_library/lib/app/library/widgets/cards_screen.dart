import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class CardsLibraryScreen extends StatelessWidget {
  const CardsLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_cards,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "SteveCard",
          type: SteveSliverTitleType.subtitle,
        ),
        SteveSliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 6,
            childAspectRatio: 3,
          ),
          children: [
            const SteveCard(
              child: _SteveCardExampleContent(text: "SteveCard"),
            ),
            SteveCard(
              onTap: () {},
              child: _SteveCardExampleContent(text: "SteveCard (${localization.library_widgets_cards_tappable})"),
            ),
          ],
        ),
      ],
    );
  }
}

class _SteveCardExampleContent extends StatelessWidget {
  const _SteveCardExampleContent({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SteveCenteredText(
      text: text,
      textStyle: theme.textTheme.displayMedium,
    );
  }
}
