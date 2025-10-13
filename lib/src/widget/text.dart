import "package:flutter/material.dart";

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
