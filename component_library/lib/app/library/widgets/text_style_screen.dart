import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class TextStyleLibraryScreen extends StatelessWidget {
  const TextStyleLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_text_style,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: const [
        SteveSliverBreadcrumbs(),
        SteveSliverTitle(
          title: "Text Styles",
          type: .subtitle,
        ),
        SteveSliverToBoxAdapter(
          child: _TextStylesColumn(),
        ),
        SteveSliverTitle(
          title: "Font Weights & Styles",
          type: .subtitle,
        ),
        SteveSliverToBoxAdapter(
          child: _FontWeightsColumn(),
        ),
        SteveSliverBottomSpacing(),
      ],
    );
  }
}

class _TextStylesColumn extends StatelessWidget {
  const _TextStylesColumn();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text("Display Large", style: theme.textTheme.displayLarge),
        Text("Display Medium", style: theme.textTheme.displayMedium),
        Text("Display Small", style: theme.textTheme.displaySmall),
        Text("Headline Large", style: theme.textTheme.headlineLarge),
        Text("Headline Medium", style: theme.textTheme.headlineMedium),
        Text("Headline Small", style: theme.textTheme.headlineSmall),
        Text("Title Large", style: theme.textTheme.titleLarge),
        Text("Title Medium", style: theme.textTheme.titleMedium),
        Text("Title Small", style: theme.textTheme.titleSmall),
        Text("Label Large", style: theme.textTheme.labelLarge),
        Text("Label Medium", style: theme.textTheme.labelMedium),
        Text("Label Small", style: theme.textTheme.labelSmall),
        Text("Body Large", style: theme.textTheme.bodyLarge),
        Text("Body Medium", style: theme.textTheme.bodyMedium),
        Text("Body Small", style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _FontWeightsColumn extends StatelessWidget {
  const _FontWeightsColumn();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "(W100) Thin",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w100),
        ),
        Text(
          "(W100) Thin Italic",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w100, fontStyle: .italic),
        ),
        Text(
          "(W300) Light",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w300),
        ),
        Text(
          "(W300) Light italic",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w300, fontStyle: .italic),
        ),
        Text(
          "(W400) Regular",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w400),
        ),
        Text(
          "(W400) Regular italic",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w400, fontStyle: .italic),
        ),
        Text(
          "(W500) Medium",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w500),
        ),
        Text(
          "(W500) Medium italic",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w500, fontStyle: .italic),
        ),
        Text(
          "(W700) Bold",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w700),
        ),
        Text(
          "(W700) Bold italic",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w700, fontStyle: .italic),
        ),
        Text(
          "(W900) Black",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w900),
        ),
        Text(
          "(W900) Black italic",
          style: theme.textTheme.titleLarge!.copyWith(fontWeight: .w900, fontStyle: .italic),
        ),
      ],
    );
  }
}
