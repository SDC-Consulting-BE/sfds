import "package:component_library/app_constants.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:sfds/widget.dart";

const _libraryGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 300,
  childAspectRatio: 4,
  mainAxisSpacing: 4,
  crossAxisSpacing: 4,
);

class LibraryLinkSection extends StatelessWidget {
  const LibraryLinkSection({
    super.key,
    required this.links,
  });

  final List<LibraryLink> links;

  @override
  Widget build(BuildContext context) => SteveSliverGrid(
    gridDelegate: _libraryGridDelegate,
    children: links
        .map(
          (link) => SteveCard(
            onTap: () => context.go(link.routerLink),
            child: _LibraryLinkCard(
              title: link.title,
              icon: link.icon,
            ),
          ),
        )
        .toList(),
  );
}

class _LibraryLinkCard extends StatelessWidget {
  const _LibraryLinkCard({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon),
      sizedBoxW8,
      Text(title),
    ],
  );
}

class LibraryLink {
  const LibraryLink(
    this.title,
    this.icon,
    this.routerLink,
  );

  final String title;
  final IconData icon;
  final String routerLink;
}
