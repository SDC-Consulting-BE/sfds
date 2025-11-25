import "package:flutter/material.dart";

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Text("Loading", style: theme.textTheme.displayLarge),
    );
  }
}
