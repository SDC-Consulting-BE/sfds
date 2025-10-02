import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/theme/color_scheme_extension.dart";
import "package:sfds/src/theme/theme_constants.dart";

ThemeData themeData(ColorScheme colorScheme) => ThemeData(
  brightness: colorScheme.brightness,
  colorScheme: colorScheme,
  textTheme: const TextTheme().apply(
    bodyColor: colorScheme.onSurface,
    displayColor: colorScheme.onSurface,
  ),
  scaffoldBackgroundColor: colorScheme.surface,
  canvasColor: colorScheme.surface,
  hoverColor: colorScheme.primaryContainer,
  splashColor: colorScheme.inversePrimary,
  extensions: [colorScheme.brightness.colorSchemeExtension],
  cardTheme: const CardThemeData(
    elevation: themeDefaultElevation,
    margin: paddingZero,
    shape: themeDefaultShape,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(themeDefaultElevation),
      minimumSize: const WidgetStatePropertyAll(Size(1, themeDefaultButtonHeight)),
      shape: const WidgetStatePropertyAll(themeDefaultShape),
      backgroundColor: WidgetStateProperty.fromMap({
        WidgetState.disabled: null,
        WidgetState.any: colorScheme.secondary,
      }),
      foregroundColor: WidgetStateProperty.fromMap({
        WidgetState.disabled: null,
        WidgetState.any: colorScheme.onSecondary,
      }),
      overlayColor: WidgetStateProperty.fromMap({
        WidgetState.disabled: null,
        WidgetState.pressed: colorScheme.brightness == Brightness.light ? colorScheme.secondaryContainer.withValues(alpha: 0.2) : colorScheme.secondaryContainer.withValues(alpha: 0.3),
        WidgetState.hovered: colorScheme.brightness == Brightness.light ? Colors.white.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.15),
        WidgetState.any: null,
      }),
    ),
  ),
  dialogTheme: const DialogThemeData(
    elevation: themeDefaultElevation,
    shape: themeDefaultShape,
  ),
  listTileTheme: const ListTileThemeData(
    shape: themeDefaultShape,
  ),
  switchTheme: SwitchThemeData(
    splashRadius: 0,
    trackOutlineWidth: const WidgetStatePropertyAll(themeDefaultBorderWidth),
    trackColor: WidgetStateProperty.fromMap({
      WidgetState.disabled: null,
      WidgetState.selected: colorScheme.secondary,
      WidgetState.any: null,
    }),
    thumbColor: WidgetStateProperty.fromMap({
      WidgetState.disabled: null,
      WidgetState.selected: colorScheme.onSecondary,
      WidgetState.any: colorScheme.secondary,
    }),
    trackOutlineColor: WidgetStateProperty.fromMap({
      WidgetState.disabled: null,
      WidgetState.any: colorScheme.secondary,
    }),
  ),
);

class SteveColorSchemeExtension extends ThemeExtension<SteveColorSchemeExtension> {
  const SteveColorSchemeExtension({
    required this.success,
    required this.warning,
    required this.hyperlink,
    required this.favorite,
  });

  final SteveExtendedColor success;
  final SteveExtendedColor warning;
  final SteveExtendedColor hyperlink;
  final SteveExtendedColor favorite;

  @override
  SteveColorSchemeExtension copyWith({
    SteveExtendedColor? success,
    SteveExtendedColor? warning,
    SteveExtendedColor? hyperlink,
    SteveExtendedColor? favorite,
  }) => SteveColorSchemeExtension(
    success: success ?? this.success,
    warning: warning ?? this.warning,
    hyperlink: hyperlink ?? this.hyperlink,
    favorite: favorite ?? this.favorite,
  );

  @override
  SteveColorSchemeExtension lerp(ThemeExtension? other, double t) {
    if (other is! SteveColorSchemeExtension) {
      return this;
    }
    return SteveColorSchemeExtension(
      success: success.lerp(other.success, t),
      warning: warning.lerp(other.warning, t),
      hyperlink: hyperlink.lerp(other.hyperlink, t),
      favorite: favorite.lerp(other.favorite, t),
    );
  }
}

class SteveExtendedColor {
  const SteveExtendedColor({
    required this.color,
    required this.onColor,
    required this.container,
    required this.onContainer,
  });

  final Color color;
  final Color onColor;
  final Color container;
  final Color onContainer;

  SteveExtendedColor lerp(SteveExtendedColor other, double t) => SteveExtendedColor(
    color: Color.lerp(color, other.color, t)!,
    onColor: Color.lerp(onColor, other.onColor, t)!,
    container: Color.lerp(container, other.container, t)!,
    onContainer: Color.lerp(onContainer, other.onContainer, t)!,
  );
}
