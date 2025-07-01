import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";
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
  final List<SteveViewAppBarAction> actions;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appBarTitleStyle = theme.textTheme.displayLarge!;
    var appBarTitleStyleHeight = TextStyleUtil.getTrueHeight(appBarTitleStyle);
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
      actions: CollectionUtil.intersperse(_steveSliverViewAppBarIconsSpacer, actions).toList(),
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
