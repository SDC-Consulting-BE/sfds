import "package:flutter/material.dart";

class SteveColorUtil {
  const SteveColorUtil._();

  static Color colorFromHexString(String hexString) {
    var stringBuffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      stringBuffer.write("FF");
    }
    stringBuffer.write(hexString.replaceFirst("#", ""));
    var colorValue = int.parse(stringBuffer.toString(), radix: 16);
    return Color(colorValue);
  }
}
