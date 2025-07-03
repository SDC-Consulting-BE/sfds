import "package:flutter/material.dart";
import "package:sfds/src/theme/theme.dart";

const SteveColorSchemeExtension colorSchemeExtension = SteveColorSchemeExtension(
  success: success,
  warning: warning,
  hyperlink: hyperlink,
  favorite: favorite,
);

// Seed: 4bb543
const success = SteveExtendedColor(
  color: Color(0xff3e6837),
  onColor: Color(0xffffffff),
  container: Color(0xffbff0b1),
  onContainer: Color(0xff275021),
);

// Seed: ffa500
const warning = SteveExtendedColor(
    color: Color(0xff815512),
    onColor: Color(0xffffffff),
    container: Color(0xffffddb7),
    onContainer: Color(0xff653e00),
);

// Seed: 0000ee
const hyperlink = SteveExtendedColor(
  color: Color(0xff555992),
  onColor: Color(0xffffffff),
  container: Color(0xffe0e0ff),
  onContainer: Color(0xff3e4278),
);

// Seed: ffd700
const favorite = SteveExtendedColor(
  color: Color(0xff6f5d0e),
  onColor: Color(0xffffffff),
  container: Color(0xfffae287),
  onContainer: Color(0xff544600),
);
