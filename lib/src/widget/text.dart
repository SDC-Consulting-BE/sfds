import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";

class SteveCenteredText extends StatelessWidget {
  const SteveCenteredText({
    super.key,
    required this.text,
    this.textStyle,
  });

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      text,
      style: textStyle,
    ),
  );
}

const _textPlaceholderScaleFactor = 0.8;

class SteveTextPlaceholder extends StatelessWidget {
  const SteveTextPlaceholder({
    super.key,
    this.width,
    this.textStyle,
  });

  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = _calculateTextHeight(context);
    return SizedBox(
      width: width ?? double.infinity,
      height: height * _textPlaceholderScaleFactor,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.outline,
          borderRadius: borderRadiusC8,
        ),
      ),
    );
  }

  double _calculateTextHeight(BuildContext context) {
    var inheritedTextStyle = textStyle ?? DefaultTextStyle.of(context).style;
    var textPainter = TextPainter(
      text: TextSpan(text: "M", style: inheritedTextStyle),
      textDirection: .ltr,
    )..layout();
    return textPainter.height;
  }
}
