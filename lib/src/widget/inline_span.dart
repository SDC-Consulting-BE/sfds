import "dart:async";

import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:sfds/src/theme/theme.dart";
import "package:sfds/src/util/navigation_util.dart";

class SteveTextSpanHyperlink extends TextSpan {
  SteveTextSpanHyperlink({
    required String text,
    required String url,
    required BuildContext context,
  }) : super(
         text: text,
         style: TextStyle(
           decoration: TextDecoration.underline,
           color: Theme.of(context).extension<SteveColorSchemeExtension>()!.hyperlink.color,
         ),
         recognizer: TapGestureRecognizer()..onTap = () => unawaited(SteveNavigationUtil.openUrlInNewTab(url)),
       );
}
