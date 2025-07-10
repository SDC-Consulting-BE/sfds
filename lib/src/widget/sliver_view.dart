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

const _steveSliverViewActionDefaultScale = 1.0;
const _steveSliverViewActionHoverScale = 1.314;
const _steveSliverViewActionScaleAnimationDuration = durationMs100;
const _steveSliverViewActionSplashBorder = roundedRectangleBorderC12;
const _steveSliverViewActionPadding = paddingA6;

class SteveViewAppBarAction extends StatefulWidget {
  const SteveViewAppBarAction({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  State<SteveViewAppBarAction> createState() => _SteveViewAppBarActionState();
}

class _SteveViewAppBarActionState extends State<SteveViewAppBarAction> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var hoveredColor = theme.colorScheme.primary;
    return AnimatedScale(
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
          child: Icon(
            widget.icon,
            color: _hovered ? hoveredColor : null,
          ),
        ),
      ),
    );
  }

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

// TODO(sdecleene): nested widget to reduce load
// TODO(sdecleene): extract shared logic with "action
class SteveViewAppBarActionLocaleSwitcher extends ConsumerStatefulWidget {
  const SteveViewAppBarActionLocaleSwitcher({
    super.key,
    required this.supportedLocales,
  });

  final List<Locale> supportedLocales;

  @override
  ConsumerState createState() => _SteveViewAppBarActionLocaleSwitcherState();
}

const _localeLanguageDescriptions = {
  "de": "Deutsch",
  "en": "English",
  "fr": "Français",
  "nl": "Nederlands",
};

class _SteveViewAppBarActionLocaleSwitcherState extends ConsumerState<SteveViewAppBarActionLocaleSwitcher> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    var localeNotifier = ref.read(steveLocaleProvider.notifier);
    var locale = ref.watch(steveLocaleProvider) ?? Localizations.localeOf(context);
    var theme = Theme.of(context);
    var hoveredColor = theme.colorScheme.primary;
    return AnimatedScale(
      scale: _hovered ? _steveSliverViewActionHoverScale : _steveSliverViewActionDefaultScale,
      duration: _steveSliverViewActionScaleAnimationDuration,
      child: InkWell(
        onTap: () {},
        onHover: _updateHovered,
        hoverColor: colorTransparant,
        highlightColor: colorTransparant,
        customBorder: _steveSliverViewActionSplashBorder,
        child: Padding(
          padding: _steveSliverViewActionPadding,
          child: PopupMenuButton<Locale>(
            initialValue: locale,
            onSelected: localeNotifier.selectLocale,
            itemBuilder: (context) => widget.supportedLocales.map((supportedLocale) => PopupMenuItem<Locale>(
              value: supportedLocale,
              child: Text("${supportedLocale.languageCode} - ${_localeLanguageDescriptions[supportedLocale.languageCode] ?? "???"}"),
            )).toList(),
            child: SizedBox(
              width: 42,
              height: 42,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  locale.languageCode,
                  style: TextStyle(
                    color: _hovered ? hoveredColor : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateHovered(bool hovered) {
    setState(() {
      _hovered = hovered;
    });
  }
}
