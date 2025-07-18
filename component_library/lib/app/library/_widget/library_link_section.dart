import "package:component_library/app_constants.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
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
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverGrid(
      gridDelegate: _libraryGridDelegate,
      children: links
          .map(
            (link) => SteveCard(
              onTap: () => context.go(link.routerLink),
              child: _LibraryLinkCard(
                title: link.titleExtractor.call(localization),
                icon: link.icon,
              ),
            ),
          )
          .toList(),
    );
  }
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
  const LibraryLink(this.titleExtractor,
    this.icon,
    this.routerLink,
  );

  final String Function(Localization) titleExtractor;
  final IconData icon;
  final String routerLink;
}
