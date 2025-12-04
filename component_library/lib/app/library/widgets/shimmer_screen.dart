import "package:component_library/app_constants.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class ShimmerLibraryScreen extends StatelessWidget {
  const ShimmerLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_shimmer,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "SteveShimmer",
          type: .subtitle,
        ),
        SteveSliverText(
          text: localization.library_widgets_shimmer_description,
        ),
        const SteveSliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            childAspectRatio: 4,
          ),
          children: [
            _SteveShimmerExample(),
            _SteveShimmerExample(shimmer: true),
          ],
        ),
        SteveSliverText(
          text: localization.library_widgets_shimmer_textplaceholder_description,
        ),
        const SteveSliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            childAspectRatio: 4.5,
          ),
          children: [
            _SteveShimmerExample(),
            _SteveShimmerExample(
              shimmer: true,
              textPlaceholder: true,
            ),
          ],
        ),
      ],
    );
  }
}

class _SteveShimmerExample extends StatelessWidget {
  const _SteveShimmerExample({
    this.shimmer = false,
    this.textPlaceholder = false,
  });

  final bool shimmer;
  final bool textPlaceholder;

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    var theme = Theme.of(context);
    var titleTextStyle = theme.textTheme.titleLarge;
    var bodyTextStyle = theme.textTheme.bodyMedium;
    return SteveCard(
      onTap: () {},
      scrollable: true,
      child: SteveConditionalWidgetWrapper(
        condition: shimmer,
        widgetWrapper: (child) => SteveShimmer(child: child),
        child: Row(
          children: [
            const Icon(Icons.account_circle, size: 50),
            sizedBoxW8,
            Expanded(
              child: ListView(
                children: [
                  sizedBoxH8,
                  if (!textPlaceholder) ...[
                    Text("Shimmer", style: titleTextStyle),
                    Text(localization.lorem_ipsum, style: bodyTextStyle),
                  ],
                  if (textPlaceholder) ...[
                    SteveTextPlaceholder(textStyle: titleTextStyle),
                    SteveTextPlaceholder(textStyle: bodyTextStyle),
                    SteveTextPlaceholder(textStyle: bodyTextStyle),
                    SteveTextPlaceholder(textStyle: bodyTextStyle),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
