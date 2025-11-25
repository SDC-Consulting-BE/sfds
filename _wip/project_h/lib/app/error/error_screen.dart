import "package:flutter/material.dart";

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Text("ERROR", style: theme.textTheme.displayLarge),
    );
  }
}
