import "package:flutter/material.dart";

class SteveTextStyleUtil {
  const SteveTextStyleUtil._();

  static double getTrueHeight(TextStyle textStyle) => textStyle.height! * textStyle.fontSize!;
}
