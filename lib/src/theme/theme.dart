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
  cardTheme: CardThemeData(
    elevation: themeDefaultElevation,
    margin: paddingZero,
    shape: themeDefaultShape,
    color: colorScheme.surfaceContainer,
    // color: colorScheme.brightness == Brightness.light ? colorScheme.surfaceDim : colorScheme.surfaceBright,
  ),
  dialogTheme: const DialogThemeData(
    elevation: themeDefaultElevation,
    shape: themeDefaultShape,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(themeDefaultElevation),
      fixedSize: const WidgetStatePropertyAll(.fromHeight(themeDefaultButtonHeight)),
      shape: const WidgetStatePropertyAll(themeDefaultShape),
      backgroundColor: .fromMap({
        WidgetState.disabled: null,
        WidgetState.any: colorScheme.secondary,
      }),
      foregroundColor: .fromMap({
        WidgetState.disabled: null,
        WidgetState.any: colorScheme.onSecondary,
      }),
      overlayColor: .fromMap({
        WidgetState.disabled: null,
        WidgetState.pressed: colorScheme.brightness == .light ? colorScheme.secondaryContainer.withValues(alpha: 0.2) : colorScheme.secondaryContainer.withValues(alpha: 0.3),
        WidgetState.hovered: colorScheme.brightness == .light ? Colors.white.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.15),
        WidgetState.any: null,
      }),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    shape: themeDefaultShape,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(themeDefaultElevation),
      fixedSize: const WidgetStatePropertyAll(.fromHeight(themeDefaultButtonHeight)),
      shape: const WidgetStatePropertyAll(themeDefaultShape),
      foregroundColor: .fromMap({
        WidgetState.disabled: null,
        WidgetState.any: colorScheme.secondary,
      }),
      overlayColor: .fromMap({
        WidgetState.disabled: null,
        WidgetState.pressed: colorScheme.secondary.withValues(alpha: 0.1),
        WidgetState.hovered: colorScheme.brightness == .light ? colorScheme.secondary.withValues(alpha: 0.15) : colorScheme.secondaryContainer.withValues(alpha: 0.35),
        WidgetState.any: null,
      }),
      side: .fromMap({
        WidgetState.disabled: null,
        WidgetState.any: BorderSide(color: colorScheme.secondary, width: themeDefaultBorderWidth),
      }),
    ),
  ),
  switchTheme: SwitchThemeData(
    splashRadius: 0,
    trackOutlineWidth: const WidgetStatePropertyAll(themeDefaultBorderWidth),
    trackColor: .fromMap({
      WidgetState.disabled: null,
      WidgetState.selected: colorScheme.secondary,
      WidgetState.any: null,
    }),
    thumbColor: .fromMap({
      WidgetState.disabled: null,
      WidgetState.selected: colorScheme.onSecondary,
      WidgetState.any: colorScheme.secondary,
    }),
    trackOutlineColor: .fromMap({
      WidgetState.disabled: null,
      WidgetState.any: colorScheme.secondary,
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(themeDefaultElevation),
      fixedSize: const WidgetStatePropertyAll(.fromHeight(themeDefaultButtonHeight)),
      shape: const WidgetStatePropertyAll(themeDefaultShape),
      foregroundColor: .fromMap({
        WidgetState.disabled: null,
        WidgetState.any: colorScheme.secondary,
      }),
      overlayColor: .fromMap({
        WidgetState.disabled: null,
        WidgetState.pressed: colorScheme.secondary.withValues(alpha: 0.1),
        WidgetState.hovered: colorScheme.brightness == Brightness.light ? colorScheme.secondary.withValues(alpha: 0.15) : colorScheme.secondaryContainer.withValues(alpha: 0.35),
        WidgetState.any: null,
      }),
    ),
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
    color: .lerp(color, other.color, t)!,
    onColor: .lerp(onColor, other.onColor, t)!,
    container: .lerp(container, other.container, t)!,
    onContainer: .lerp(onContainer, other.onContainer, t)!,
  );
}
