import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class CardLibraryScreen extends StatelessWidget {
  const CardLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => const SteveSliverView(
    appBar: SteveSliverViewAppBar(
      title: "Cards",
      actions: [
        SteveSliverViewAppBarActionThemeSwitcher(),
      ],
    ),
    slivers: [SteveSliverBreadcrumbs()],
  );
}
