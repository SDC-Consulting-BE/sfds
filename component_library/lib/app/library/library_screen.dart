import "package:component_library/app/library/library_links.dart";
import "package:component_library/app/library/widget/library_link_section.dart";
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
      const SteveSliverText(
        text:
            "The component library contains a categorized visual representation of all widgets contained in Steve's Flutter Design System, along with additional clarification where needed. For a guide on how to set up this system in your project(s), check out the readme.",
      ),
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
