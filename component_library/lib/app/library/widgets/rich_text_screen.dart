import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class RichTextScreen extends StatelessWidget {
  const RichTextScreen({super.key});

  @override
  Widget build(BuildContext context) => SteveSliverView(
    appBar: const SteveSliverViewAppBar(
      title: "Rich Text",
      actions: [
        SteveSliverViewAppBarActionThemeSwitcher(),
      ],
    ),
    slivers: [
      const SteveSliverBreadcrumbs(),
      const SteveSliverTitle(
        title: "SteveTextSpanHyperlink",
        type: SteveSliverTitleType.subtitle,
      ),
      SteveSliverRichText(
        inlineSpans: [
          SteveTextSpanHyperlink(
            text: "Hyperlink",
            url: "https://github.com/SDC-Consulting-BE/sfds",
            context: context,
          ),
        ],
      ),
    ],
  );
}
