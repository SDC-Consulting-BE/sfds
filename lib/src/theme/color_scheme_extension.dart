import "package:flutter/material.dart";
import "package:sfds/src/theme/theme.dart";

extension SteveColorSchemeExtensionForBrightness on Brightness {
  SteveColorSchemeExtension get colorSchemeExtension => switch (this) {
    .light => _colorSchemeExtensionLight,
    .dark => _colorSchemeExtensionDark,
  };
}

const SteveColorSchemeExtension _colorSchemeExtensionLight = SteveColorSchemeExtension(
  success: _successLight,
  warning: _warningLight,
  hyperlink: _hyperlinkLight,
  favorite: _favoriteLight,
);
const SteveColorSchemeExtension _colorSchemeExtensionDark = SteveColorSchemeExtension(
  success: _successDark,
  warning: _warningDark,
  hyperlink: _hyperlinkDark,
  favorite: _favoriteDark,
);

// Seed: 4bb543
const _successLight = SteveExtendedColor(
  color: Color(0xff3e6837),
  onColor: Color(0xffffffff),
  container: Color(0xffbff0b1),
  onContainer: Color(0xff275021),
);
const _successDark = SteveExtendedColor(
  color: Color(0xffa4d397),
  onColor: Color(0xff0f380d),
  container: Color(0xff275021),
  onContainer: Color(0xffbff0b1),
);

// Seed: ffa500
const _warningLight = SteveExtendedColor(
  color: Color(0xff815512),
  onColor: Color(0xffffffff),
  container: Color(0xffffddb7),
  onContainer: Color(0xff653e00),
);
const _warningDark = SteveExtendedColor(
  color: Color(0xfff7bb70),
  onColor: Color(0xff462a00),
  container: Color(0xff653e00),
  onContainer: Color(0xffffddb7),
);

// Seed: 0000ee
const _hyperlinkLight = SteveExtendedColor(
  color: Color(0xff555992),
  onColor: Color(0xffffffff),
  container: Color(0xffe0e0ff),
  onContainer: Color(0xff3e4278),
);
const _hyperlinkDark = SteveExtendedColor(
  color: Color(0xffbfc2ff),
  onColor: Color(0xff272b60),
  container: Color(0xff3e4278),
  onContainer: Color(0xffe0e0ff),
);

// Seed: ffd700
const _favoriteLight = SteveExtendedColor(
  color: Color(0xff6f5d0e),
  onColor: Color(0xffffffff),
  container: Color(0xfffae287),
  onContainer: Color(0xff544600),
);
const _favoriteDark = SteveExtendedColor(
  color: Color(0xffddc66e),
  onColor: Color(0xff3a3000),
  container: Color(0xff544600),
  onContainer: Color(0xfffae287),
);
