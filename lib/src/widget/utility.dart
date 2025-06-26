import "package:flutter/material.dart";

class ConditionalWidgetWrapper extends StatelessWidget {
  const ConditionalWidgetWrapper({
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
