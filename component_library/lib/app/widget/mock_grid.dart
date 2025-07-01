import "package:component_library/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class MockGrid extends StatelessWidget {
  const MockGrid({super.key});

  @override
  Widget build(BuildContext context) => SliverGrid(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 600,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 4,
    ),
    delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
        onTap: () => context.go(routeLibraryButtons),
        child: Container(
          alignment: Alignment.center,
          color: Colors.orange[100 * (index % 9)],
          child: Text("grid item $index"),
        ),
      ),
      childCount: 52,
    ),
  );
}
