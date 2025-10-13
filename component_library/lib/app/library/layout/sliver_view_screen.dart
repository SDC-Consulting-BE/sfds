import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class SliverViewLibraryScreen extends StatelessWidget {
  const SliverViewLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    var theme = Theme.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_layout_sliverView,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        SteveSliverViewAppBar(
          title: "SteveSliverViewAppBar",
          pinned: false,
          actions: [
            Tooltip(
              message: "SteveSliverViewAppBarAction",
              child: SteveSliverViewAppBarAction(
                onPressed: () {},
                icon: Icons.add_reaction_outlined,
              ),
            ),
            const Tooltip(
              message: "SteveSliverViewAppBarActionLocaleSwitcher",
              child: SteveSliverViewAppBarActionLocaleSwitcher(
                supportedLocales: Localization.supportedLocales,
              ),
            ),
            const Tooltip(
              message: "SteveSliverViewAppBarActionThemeSwitcher",
              child: SteveSliverViewAppBarActionThemeSwitcher(),
            ),
          ],
        ),
        const SteveSliverTitle(
          title: "SteveSliverTitle (title)",
          type: SteveSliverTitleType.title,
        ),
        const SteveSliverTitle(
          title: "SteveSliverTitle (subtitle)",
          type: SteveSliverTitleType.subtitle,
        ),
        SteveSliverText(
          text: "SteveSliverText - ${localization.lorem_ipsum}",
        ),
        SteveSliverRichText(
          inlineSpans: [
            TextSpan(
              text: "SteveSliverRichText",
              style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
            ),
            const TextSpan(
              text: " - ",
            ),
            SteveTextSpanHyperlink(
              text: "SteveTextSpanHyperlink",
              url: "https://github.com/SDC-Consulting-BE/sfds",
              context: context,
            ),
            const TextSpan(
              text: " - ",
            ),
            TextSpan(
              text: localization.lorem_ipsum,
              style: theme.textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        const SteveSliverTitle(
          title: "SteveSliverBreadcrumbs",
          type: SteveSliverTitleType.subtitle,
        ),
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "SteveSliverSpacing",
          type: SteveSliverTitleType.subtitle,
        ),
        const SteveSliverSpacing(
          height: 50,
        ),
        const SteveSliverTitle(
          title: "SteveSliverGrid",
          type: SteveSliverTitleType.subtitle,
        ),
        SteveSliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            childAspectRatio: 4,
          ),
          children: List.generate(
            8,
            (index) => SteveCard(child: Text("Grid #$index")),
          ),
        ),
        const SteveSliverTitle(
          title: "SteveSliverBottomSpacing",
          type: SteveSliverTitleType.subtitle,
        ),
        const SteveSliverBottomSpacing(),
      ],
    );
  }
}
