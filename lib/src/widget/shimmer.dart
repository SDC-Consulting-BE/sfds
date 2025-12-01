import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

class SteveShimmer extends StatelessWidget {
  const SteveShimmer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.outline,
      highlightColor: theme.colorScheme.outlineVariant,
      child: child,
    );
  }
}
