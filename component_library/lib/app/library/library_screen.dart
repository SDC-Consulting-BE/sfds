import "package:component_library/app/widget/mock_grid.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => SteveSliverView(
    appBar: SteveSliverViewAppBar(
      title: "Component Library",
      actions: [
        SteveViewAppBarAction(icon: Icons.sunny, onPressed: () {}),
        SteveViewAppBarAction(icon: Icons.sunny_snowing, onPressed: () {}),
        SteveViewAppBarAction(icon: Icons.snowing, onPressed: () {}),
      ],
    ),
    slivers: const [MockGrid()],
  );
}
