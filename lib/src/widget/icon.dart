import "package:flutter/material.dart";

class SteveIconOverlay extends StatelessWidget {
  const SteveIconOverlay({
    super.key,
    required this.icon,
    required this.overlayIcon,
  });

  final Icon icon;
  final Icon overlayIcon;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      icon,
      Positioned(
        bottom: 0,
        left: 0,
        child: Icon(
          overlayIcon.icon,
          color: overlayIcon.color,
          size: icon.size ?? IconTheme.of(context).size! / 2,
        ),
      ),
    ],
  );
}
