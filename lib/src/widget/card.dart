import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/theme/theme_constants.dart";
import "package:sfds/src/widget/utility.dart";

class SteveCard extends StatelessWidget {
  const SteveCard({
    super.key,
    required this.child,
    this.onTap,
    this.scrollable = false,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool scrollable;

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
        padding: scrollable ? paddingH12 : paddingH12V8,
        child: child,
        ),
      ),
    );
}
