import "package:component_library/app_constants.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class ShimmerLibraryScreen extends StatelessWidget {
  const ShimmerLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_shimmer,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: const [
        SteveSliverBreadcrumbs(),
        SteveSliverTitle(
          title: "SteveShimmer",
          type: .subtitle,
        ),
        SteveSliverToBoxAdapter(
          child: _SteveShimmerExample(),
        ),
      ],
    );
  }
}

class _SteveShimmerExample extends StatefulWidget {
  const _SteveShimmerExample();

  @override
  State<_SteveShimmerExample> createState() => _SteveShimmerExampleState();
}

class _SteveShimmerExampleState extends State<_SteveShimmerExample> {
  bool _shimmer = true;

  @override
  Widget build(BuildContext context) {
    var width = 100.0;
    return Row(
      children: [
        Switch(
          value: _shimmer,
          onChanged: _flipShimmer,
        ),
        sizedBoxW4,
        SteveCard(
          onTap: () {},
          child: SteveConditionalWidgetWrapper(
            condition: _shimmer,
            widgetWrapper: (child) => SteveShimmer(
              child: child,
            ),
            child: Row(
              children: [
                const Icon(Icons.account_circle),
                sizedBoxW8,
                if (_shimmer)
                  Tooltip(
                    message: "SteveTextPlaceholder",
                    child: SteveTextPlaceholder(width: width),
                  )
                else
                  SizedBox(
                    width: width,
                    child: const Text("Lorem ipsum"),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _flipShimmer(_) {
    setState(() {
      _shimmer = !_shimmer;
    });
  }
}
