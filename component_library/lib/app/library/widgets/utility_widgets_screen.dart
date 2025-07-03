import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class UtilityWidgetsLibraryScreen extends StatelessWidget {
  const UtilityWidgetsLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => const SteveSliverView(
    appBar: SteveSliverViewAppBar(
      title: "Utility Widgets",
      actions: [
        SteveViewAppBarActionThemeSwitcher(),
      ],
    ),
    slivers: [SteveSliverBreadcrumbs()],
  );
}
