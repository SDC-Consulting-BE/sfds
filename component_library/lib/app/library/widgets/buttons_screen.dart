import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class ButtonLibraryScreen extends StatelessWidget {
  const ButtonLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SteveSliverView(
      appBar: const SteveSliverViewAppBar(
        title: "Buttons",
        actions: [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "Flutter Buttons",
          type: SteveSliverTitleType.subtitle,
        ),
        SteveSliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisExtent: theme.elevatedButtonTheme.style!.fixedSize!.resolve({})!.height,
            mainAxisSpacing: 6,
          ),
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("ElevatedButton"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("OutlinedButton"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("TextButton"),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text("ElevatedButton"),
            ),
            const OutlinedButton(
              onPressed: null,
              child: Text("OutlinedButton"),
            ),
            const TextButton(
              onPressed: null,
              child: Text("TextButton"),
            ),
          ],
        ),
      ],
    );
  }
}
