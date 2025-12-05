import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class IconsLibraryScreen extends StatelessWidget {
  const IconsLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_utility_widgets,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "SteveIconOverlay",
          type: .subtitle,
        ),
        SteveSliverToBoxAdapter(
          child: SteveIconOverlay(
            icon: Icon(Icons.house, color: theme.disabledColor, size: 48),
            overlayIcon: Icon(Icons.hourglass_full, color: theme.colorScheme.error),
          ),
        ),
      ],
    );
  }
}
