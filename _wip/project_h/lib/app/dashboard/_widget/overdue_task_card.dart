import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class OverdueTaskCard extends StatelessWidget {
  const OverdueTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SteveCard(
      onTap: () {},
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text("Task description", style: theme.textTheme.titleLarge),
          Text("Due XX days ago", style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}
