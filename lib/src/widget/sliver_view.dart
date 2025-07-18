import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:sfds/provider.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/provider/locale_provider.dart";
import "package:sfds/src/util/collection_util.dart";
import "package:sfds/src/util/text_style_util.dart";

class SteveSliverView extends StatelessWidget {
  const SteveSliverView({
    super.key,
    required this.appBar,
    required this.slivers,
  });

  final SteveSliverViewAppBar appBar;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      slivers: [
        appBar,
        ...slivers,
      ],
    ),
  );
}

const _steveSliverViewAppBarPaddingFactor = 1.314;
const _steveSliverViewAppBarExpansionFactor = 2.0;
const _steveSliverViewAppBarHorizontalSpacing = 16.0;
const _steveSliverViewAppBarIconsSizeFactor = 0.5;
const _steveSliverViewAppBarIconsSpacer = sizedBoxW8;

class SteveSliverViewAppBar extends StatelessWidget {
  const SteveSliverViewAppBar({
    required this.title,
    this.actions = const [],
  });

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appBarTitleStyle = theme.textTheme.displayLarge!;
    var appBarTitleStyleHeight = SteveTextStyleUtil.getTrueHeight(appBarTitleStyle);
    var appBarHeight = appBarTitleStyleHeight * _steveSliverViewAppBarPaddingFactor;
    var appBarVerticalPadding = (appBarHeight - appBarTitleStyleHeight) / 2;
    return SliverAppBar(
      pinned: true,
      collapsedHeight: appBarHeight,
      toolbarHeight: appBarHeight,
      expandedHeight: appBarHeight * _steveSliverViewAppBarExpansionFactor,
      leading: sizedBoxZero,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: _steveSliverViewAppBarHorizontalSpacing, vertical: appBarVerticalPadding),
        expandedTitleScale: _steveSliverViewAppBarExpansionFactor,
        title: Text(title, style: appBarTitleStyle),
      ),
      actionsPadding: const EdgeInsets.only(right: _steveSliverViewAppBarHorizontalSpacing),
      actionsIconTheme: IconThemeData(
        size: appBarHeight * _steveSliverViewAppBarIconsSizeFactor,
      ),
      actions: SteveCollectionUtil.intersperse(_steveSliverViewAppBarIconsSpacer, actions).toList(),
    );
  }
}

class SteveViewAppBarAction extends StatelessWidget {
  const SteveViewAppBarAction({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => _SteveViewAppBarAction(
    onPressed: onPressed,
    child: Icon(icon),
  );
}

const _steveSliverViewActionDefaultScale = 1.0;
const _steveSliverViewActionHoverScale = 1.314;
const _steveSliverViewActionScaleAnimationDuration = durationMs100;
const _steveSliverViewActionSplashBorder = roundedRectangleBorderC12;
const _steveSliverViewActionPadding = paddingA6;
const _steveSliverViewActionSize = 42.0;

class _SteveViewAppBarAction extends StatefulWidget {
  const _SteveViewAppBarAction({
    this.boxKey,
    required this.onPressed,
    required this.child,
  });

  final GlobalKey? boxKey;
  final VoidCallback onPressed;
  final Widget child;

  @override
  State<_SteveViewAppBarAction> createState() => _SteveViewAppBarActionState();
}

class _SteveViewAppBarActionState extends State<_SteveViewAppBarAction> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) => AnimatedScale(
    scale: _hovered ? _steveSliverViewActionHoverScale : _steveSliverViewActionDefaultScale,
    duration: _steveSliverViewActionScaleAnimationDuration,
    child: InkWell(
      onTap: widget.onPressed,
      onHover: _updateHovered,
      hoverColor: colorTransparant,
      highlightColor: colorTransparant,
      customBorder: _steveSliverViewActionSplashBorder,
      child: Padding(
        padding: _steveSliverViewActionPadding,
        child: SizedBox.square(
          dimension: _steveSliverViewActionSize,
          child: FittedBox(
            key: widget.boxKey,
            fit: BoxFit.fitHeight,
            child: widget.child,
          ),
        ),
      ),
    ),
  );

  void _updateHovered(bool hovered) {
    setState(() {
      _hovered = hovered;
    });
  }
}

class SteveViewAppBarActionThemeSwitcher extends ConsumerWidget {
  const SteveViewAppBarActionThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeModeNotifier = ref.read(steveThemeModeProvider.notifier);
    var themeMode = ref.watch(steveThemeModeProvider);
    return SteveViewAppBarAction(
      icon: themeMode.icon,
      onPressed: themeModeNotifier.flipThemeMode,
    );
  }
}

extension _ThemeModeIcon on ThemeMode {
  IconData get icon => switch (this) {
    ThemeMode.light => iconDataLightMode,
    ThemeMode.dark => iconDataDarkMode,
    _ => throw UnsupportedError("ThemeMode system is not supported (and should not be possible)"),
  };
}

class SteveViewAppBarActionLocaleSwitcher extends ConsumerWidget {
  const SteveViewAppBarActionLocaleSwitcher({
    super.key,
    required this.supportedLocales,
  });

  final List<Locale> supportedLocales;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var key = GlobalKey();
    var currentLocale = ref.watch(steveLocaleProvider) ?? Localizations.localeOf(context);
    return _SteveViewAppBarAction(
      boxKey: key,
      onPressed: () => _showLocaleSelectionDialog(context, key, currentLocale),
      child: Text(currentLocale.languageCode),
    );
  }

  Future<void> _showLocaleSelectionDialog(
    BuildContext context,
    GlobalKey key,
    Locale currentLocale,
  ) async {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => _SteveViewAppBarActionLocaleSwitcherDialog(
        callersRenderBox: key.currentContext!.findRenderObject()! as RenderBox,
        supportedLocales: supportedLocales,
        currentLocale: currentLocale,
      ),
    );
  }
}

const _steveViewAppBarActionLocaleSwitcherDialogSelectedIconSize = 24.0;

class _SteveViewAppBarActionLocaleSwitcherDialog extends ConsumerWidget {
  const _SteveViewAppBarActionLocaleSwitcherDialog({
    required this.callersRenderBox,
    required this.supportedLocales,
    required this.currentLocale,
  });

  final RenderBox callersRenderBox;
  final List<Locale> supportedLocales;
  final Locale currentLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localeNotifier = ref.read(steveLocaleProvider.notifier);
    var callersOffset = callersRenderBox.localToGlobal(Offset.zero);
    var nonCurrentLocales = supportedLocales.where((supportedLocale) => currentLocale != supportedLocale);
    var navigator = Navigator.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Dialog(
      alignment: Alignment.topRight,
      insetPadding: EdgeInsets.only(
        top: callersOffset.dy,
        right: (mediaQuery.size.width - callersOffset.dx) - _steveSliverViewActionSize - _steveSliverViewActionPadding.horizontal,
      ),
      child: SizedBox(
        width: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: SteveCollectionUtil.intersperse(
            divider,
            [currentLocale, ...nonCurrentLocales].map(
              (locale) => ListTile(
                onTap: () {
                  localeNotifier.selectLocale(locale);
                  navigator.pop();
                },
                enabled: currentLocale != locale,
                leading: Text(locale.languageCode),
                title: Text("${steveLocaleLanguageDescriptions[locale.languageCode]}"),
                trailing: currentLocale == locale
                    ? const Icon(
                        iconDataSelected,
                        size: _steveViewAppBarActionLocaleSwitcherDialogSelectedIconSize,
                      )
                    : null,
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
