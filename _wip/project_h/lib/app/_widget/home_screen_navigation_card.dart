import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:project_h/app_constants.dart";
import "package:sfds/widget.dart";

class HomeScreenNavigationCard extends StatelessWidget {
  const HomeScreenNavigationCard({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) => SteveCard(
    onTap: () => context.go(route),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        sizedBoxW8,
        Text(title),
      ],
    ),
  );
}
