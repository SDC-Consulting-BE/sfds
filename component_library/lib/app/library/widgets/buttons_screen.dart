import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class ButtonsLibraryScreen extends StatelessWidget {
  const ButtonsLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    var theme = Theme.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_buttons,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "Flutter Buttons",
          type: .subtitle,
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
