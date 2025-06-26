import "package:flutter/material.dart";

class NavigationUtil {
  const NavigationUtil._();

  static void popMultiple(NavigatorState navigator, int numberOfPops) {
    var count = 0;
    navigator.popUntil((_) => count++ >= numberOfPops);
  }
}
