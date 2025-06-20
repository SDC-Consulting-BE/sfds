import "package:flutter/material.dart";
import "package:sfds/src/theme/color_scheme_extension.dart";

ThemeData theme(ColorScheme colorScheme) => ThemeData(
  brightness: colorScheme.brightness,
  colorScheme: colorScheme,
  textTheme: const TextTheme().apply(
    bodyColor: colorScheme.onSurface,
    displayColor: colorScheme.onSurface,
  ),
  scaffoldBackgroundColor: colorScheme.surface,
  canvasColor: colorScheme.surface,
  extensions: const [colorSchemeExtension],
);

class ColorSchemeExtension extends ThemeExtension<ColorSchemeExtension> {
  const ColorSchemeExtension({
    required this.success,
    required this.warning,
    required this.hyperlink,
    required this.favorite,
  });

  final ExtendedColor success;
  final ExtendedColor warning;
  final ExtendedColor hyperlink;
  final ExtendedColor favorite;

  @override
  ColorSchemeExtension copyWith({
    ExtendedColor? success,
    ExtendedColor? warning,
    ExtendedColor? hyperlink,
    ExtendedColor? favorite,
  }) => ColorSchemeExtension(
    success: success ?? this.success,
    warning: warning ?? this.warning,
    hyperlink: hyperlink ?? this.hyperlink,
    favorite: favorite ?? this.favorite,
  );

  @override
  ColorSchemeExtension lerp(ThemeExtension? other, double t) {
    if (other is! ColorSchemeExtension) {
      return this;
    }
    return ColorSchemeExtension(
      success: success.lerp(other.success, t),
      warning: warning.lerp(other.warning, t),
      hyperlink: hyperlink.lerp(other.hyperlink, t),
      favorite: favorite.lerp(other.favorite, t),
    );
  }
}

class ExtendedColor {
  const ExtendedColor({
    required this.color,
    required this.onColor,
    required this.container,
    required this.onContainer,
  });

  final Color color;
  final Color onColor;
  final Color container;
  final Color onContainer;

  ExtendedColor lerp(ExtendedColor other, double t) => ExtendedColor(
    color: Color.lerp(color, other.color, t)!,
    onColor: Color.lerp(onColor, other.onColor, t)!,
    container: Color.lerp(container, other.container, t)!,
    onContainer: Color.lerp(onContainer, other.onContainer, t)!,
  );
}
