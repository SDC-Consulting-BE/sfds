import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class ButtonLibraryScreen extends StatelessWidget {
  const ButtonLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => const SteveView(
    appBar: SteveViewAppBar(title: "Buttons"),
    slivers: [
      SteveSliverBreadcrumbs(),
      _MockGrid(),
    ],
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
        color: Colors.amber[100 * (index % 9)],
        child: Text("grid item $index"),
      ),
      childCount: 52,
    ),
  );
}
