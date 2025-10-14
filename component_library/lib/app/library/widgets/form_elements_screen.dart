import "package:component_library/app_constants.dart";
import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/widget.dart";

class FormElementsLibraryScreen extends StatelessWidget {
  const FormElementsLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_form_elements,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: const [
        SteveSliverBreadcrumbs(),
        SteveSliverTitle(
          title: "Switch",
          type: SteveSliverTitleType.subtitle,
        ),
        _FormElementsSwitchExample(),
      ],
    );
  }
}

class _FormElementsSwitchExample extends StatefulWidget {
  const _FormElementsSwitchExample();

  @override
  State<_FormElementsSwitchExample> createState() => _FormElementsSwitchExampleState();
}

class _FormElementsSwitchExampleState extends State<_FormElementsSwitchExample> {
  bool _value = false;

  @override
  Widget build(BuildContext context) => SteveSliverToBoxAdapter(
    child: Row(
      children: [
        Switch(
          onChanged: _flipValue,
          value: _value,
        ),
        sizedBoxW8,
        Switch(
          onChanged: null,
          value: _value,
        ),
      ],
    ),
  );

  void _flipValue(_) {
    setState(() {
      _value = !_value;
    });
  }
}
