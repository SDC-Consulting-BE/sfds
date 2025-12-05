import "package:flutter/material.dart";

class SteveConditionalWidgetWrapper extends StatelessWidget {
  const SteveConditionalWidgetWrapper({
    super.key,
    required this.condition,
    required this.child,
    required this.widgetWrapper,
  });

  final bool condition;
  final Widget Function(Widget child) widgetWrapper;
  final Widget child;

  @override
  Widget build(BuildContext context) => condition ? widgetWrapper(child) : child;
}
