import "package:component_library/app_constants.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class UtilityWidgetsLibraryScreen extends StatelessWidget {
  const UtilityWidgetsLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: "SteveConditionalWidgetWrapper",
          type: .subtitle,
        ),
        SteveSliverText(
          text: localization.library_widgets_utility_conditional_tooltip,
        ),
        const SteveSliverToBoxAdapter(
          child: _SteveConditionalWidgetWrapperExample(),
        ),
      ],
    );
  }
}

class _SteveConditionalWidgetWrapperExample extends StatefulWidget {
  const _SteveConditionalWidgetWrapperExample();

  @override
  State<_SteveConditionalWidgetWrapperExample> createState() => _SteveConditionalWidgetWrapperExampleState();
}

class _SteveConditionalWidgetWrapperExampleState extends State<_SteveConditionalWidgetWrapperExample> {
  bool _wrapped = false;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Switch(
        value: _wrapped,
        onChanged: _flipWrapped,
      ),
      sizedBoxW4,
      SteveConditionalWidgetWrapper(
        condition: _wrapped,
        widgetWrapper: (child) => Tooltip(
          message: "Tooltip",
          child: child,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Button"),
        ),
      ),
    ],
  );

  void _flipWrapped(_) {
    setState(() {
      _wrapped = !_wrapped;
    });
  }
}
