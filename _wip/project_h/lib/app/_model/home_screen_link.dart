import "package:flutter/material.dart";
import "package:project_h/l10n/generated/app_localizations.dart";

class HomeScreenLink {
  const HomeScreenLink({
    required this.titleExtractor,
    required this.icon,
    required this.routerLink,
  });

  final String Function(Localization) titleExtractor;
  final IconData icon;
  final String routerLink;
}
