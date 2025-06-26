import "package:flutter/material.dart";

class TextStyleUtil {
  const TextStyleUtil._();

  static double getTrueHeight(TextStyle textStyle) => textStyle.height! * textStyle.fontSize!;
}
