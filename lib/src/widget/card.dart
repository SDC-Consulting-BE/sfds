import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/theme/theme_constants.dart";
import "package:sfds/src/widget/utility.dart";

class SteveCard extends StatelessWidget {
  const SteveCard({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
    child: SteveConditionalWidgetWrapper(
        condition: onTap != null,
        widgetWrapper: (child) => InkWell(
        borderRadius: themeDefaultShape.borderRadius.resolve(themeDefaultTextDirection),
        onTap: onTap,
          child: child,
        ),
        child: Padding(
          padding: paddingH12V8,
          child: child,
        ),
      ),
    );
}
