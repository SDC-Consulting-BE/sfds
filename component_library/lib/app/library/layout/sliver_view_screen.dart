import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class SliverViewLibraryScreen extends StatelessWidget {
  const SliverViewLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_layout,
        actions: const [
          SteveViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: const [
        SteveSliverBreadcrumbs(),
      ],
    );
  }
}
