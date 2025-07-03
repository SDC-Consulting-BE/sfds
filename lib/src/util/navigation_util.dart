import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class SteveNavigationUtil {
  const SteveNavigationUtil._();

  static void popMultiple(NavigatorState navigator, int numberOfPops) {
    var count = 0;
    navigator.popUntil((_) => count++ >= numberOfPops);
  }

  static Future<void> openUrlInNewTab(String url) async {
    var uri = Uri.parse(url);
    await launchUrl(uri, webOnlyWindowName: "_blank");
  }
}
