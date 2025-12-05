import "package:component_library/l10n/generated/app_localizations.dart";
import "package:flutter/material.dart";
import "package:sfds/util.dart";
import "package:sfds/widget.dart";

class ToastScreen extends StatelessWidget {
  const ToastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    var theme = Theme.of(context);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.library_widgets_toast,
        showBackNavigation: true,
        actions: const [
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        const SteveSliverBreadcrumbs(),
        const SteveSliverTitle(
          title: "SteveToast",
          type: .subtitle,
        ),
        SteveSliverText(
          text: localization.library_widgets_toast_description,
        ),
        SteveSliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisExtent: theme.elevatedButtonTheme.style!.fixedSize!.resolve({})!.height,
            mainAxisSpacing: 6,
          ),
          children: const [
            _ToastExample(level: .info),
            _ToastExample(level: .warning),
            _ToastExample(level: .error),
          ],
        ),
      ],
    );
  }
}

class _ToastExample extends StatelessWidget {
  const _ToastExample({
    required this.level,
  });

  final SteveToastLevel level;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: () => SteveToast.showToast(context, level, "${SteveStringUtil.capitalize(level.name)} toast"),
    child: Text("${SteveStringUtil.capitalize(level.name)} toast"),
  );
}
