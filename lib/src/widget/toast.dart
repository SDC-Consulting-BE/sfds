import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/theme/theme.dart";

class SteveToast extends StatelessWidget {
  const SteveToast._({
    required this.level,
    required this.text,
  });

  final SteveToastLevel level;
  final String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var foregroundColor = level.getForegroundColor(theme);
    return GestureDetector(
      onTap: ScaffoldMessenger.of(context).hideCurrentSnackBar,
      child: Container(
        padding: paddingH12V8,
        color: colorTransparant,
        child: Row(
          children: [
            Icon(
              level.iconData,
              color: foregroundColor,
            ),
            sizedBoxW8,
            Text(
              text,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showToast(BuildContext context, SteveToastLevel level, String text) {
    var theme = Theme.of(context);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          padding: paddingZero,
          backgroundColor: level.getBackgroundColor(theme),
          content: SteveToast._(
            level: level,
            text: text,
          ),
        ),
      );
  }
}

enum SteveToastLevel {
  info,
  warning,
  error,
}

extension _SteveToastLevelIconData on SteveToastLevel {
  IconData get iconData => switch (this) {
    .info => iconDataInfo,
    .warning => iconDataWarning,
    .error => iconDataError,
  };
}

extension _SteveToastLevelColor on SteveToastLevel {
  Color getBackgroundColor(ThemeData theme) => switch (this) {
    .info => theme.colorScheme.tertiary,
    .warning => (theme.extension<SteveColorSchemeExtension>()!).warning.color,
    .error => theme.colorScheme.error,
  };

  Color getForegroundColor(ThemeData theme) => switch (this) {
    .info => theme.colorScheme.tertiaryContainer,
    .warning => (theme.extension<SteveColorSchemeExtension>()!).warning.container,
    .error => theme.colorScheme.errorContainer,
  };
}
