import "package:flutter/cupertino.dart";

class SteveTaskSchedulingUtil {
  const SteveTaskSchedulingUtil._();

  static Future<void> scheduleMicrotask(
    BuildContext context,
    VoidCallback microtask,
  ) async {
    Future.microtask(() {
      if (context.mounted) {
        microtask.call();
      }
    });
  }
}
