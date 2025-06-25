import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => SteveView(
    appBar: SteveViewAppBar(
      title: "Component Library",
      actions: [
        SteveViewAction(icon: Icons.sunny, onPressed: () {}),
        SteveViewAction(icon: Icons.sunny_snowing, onPressed: () {}),
        SteveViewAction(icon: Icons.snowing, onPressed: () {}),
      ],
    ),
    slivers: const [_MockGrid()],
  );
}

class _MockGrid extends StatelessWidget {
  const _MockGrid();

  @override
  Widget build(BuildContext context) => SliverGrid(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 600,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 4,
    ),
    delegate: SliverChildBuilderDelegate(
      (context, index) => Container(
        alignment: Alignment.center,
        color: Colors.teal[100 * (index % 9)],
        child: Text("grid item $index"),
      ),
      childCount: 52,
    ),
  );
}
