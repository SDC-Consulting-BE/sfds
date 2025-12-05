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

class SteveIconOverlay extends StatelessWidget {
  const SteveIconOverlay({
    super.key,
    required this.icon,
    required this.overlayIcon,
  });

  final Icon icon;
  final Icon overlayIcon;

  @override
  Widget build(BuildContext context) {
    var iconTheme = IconTheme.of(context);
    return Stack(
      children: [
        icon,
        Positioned(
          bottom: 0,
          left: 0,
          child: Icon(
            overlayIcon.icon,
            color: overlayIcon.color,
            size: iconTheme.size! / 2,
          ),
        ),
      ],
    );
  }
}
