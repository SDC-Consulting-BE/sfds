import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class ButtonLibraryScreen extends StatelessWidget {
  const ButtonLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => const SteveSliverView(
    appBar: SteveSliverViewAppBar(
      title: "Buttons",
      actions: [
        SteveViewAppBarActionThemeSwitcher(),
      ],
    ),
    slivers: [SteveSliverBreadcrumbs()],
  );
}
