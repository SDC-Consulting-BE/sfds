import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class SliverViewLibraryScreen extends StatelessWidget {
  const SliverViewLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => const SteveSliverView(
    appBar: SteveSliverViewAppBar(title: "Sliver View"),
    slivers: [SteveSliverBreadcrumbs()],
  );
}
