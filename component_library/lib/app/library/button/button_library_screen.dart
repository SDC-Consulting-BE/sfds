import "package:flutter/material.dart";
import "package:sfds/theme.dart";

class ButtonLibraryScreen extends StatelessWidget {
  const ButtonLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var themeExtension = theme.extension<ColorSchemeExtension>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: themeExtension.warning.container,
      ),
      child: Center(
        child: Text(
          "Button Screen",
          style: theme.textTheme.displayLarge!.copyWith(color: themeExtension.warning.onContainer),
        ),
      ),
    );
  }
}
