import "package:component_library/app/library/_widget/library_link_section.dart";
import "package:component_library/app/library/library_links.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => SteveSliverView(
    appBar: SteveSliverViewAppBar(
      title: "Component Library",
      actions: [
        SteveViewAppBarAction(icon: Icons.sunny, onPressed: () {}),
        SteveViewAppBarAction(icon: Icons.sunny_snowing, onPressed: () {}),
        SteveViewAppBarAction(icon: Icons.snowing, onPressed: () {}),
      ],
    ),
    slivers: [
      SteveSliverRichText(
        inlineSpans: [
          const TextSpan(
            text:
                "The component library contains a categorized visual representation of all widgets contained in Steve's Flutter Design System, along with additional clarification where needed. Check out the readme at the ",
          ),
          SteveTextSpanHyperlink(
            text: "GitHub repository",
            url: "https://github.com/SDC-Consulting-BE/sfds",
            context: context,
          ),
          const TextSpan(text: " for a guide on how to set up this system in your project(s)."),
        ],
      ),
      const SteveSliverText(text: "Information regarding utility classes and other code related subjects can also be found in the readme."),
      ...LibraryLinkGroup.values
          .map(_librarySection) //
          .fold([], (previousValue, element) => [...previousValue, ...element]),
    ],
  );

  List<Widget> _librarySection(LibraryLinkGroup group) => [
    SteveSliverTitle(title: group.label),
    LibraryLinkSection(links: group.links),
  ];
}
