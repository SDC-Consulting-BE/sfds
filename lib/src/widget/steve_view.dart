import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/util/collection_util.dart";

const _steveViewAppBarPaddingFactor = 1.314;
const _steveViewAppBarExpansionFactor = 2.0;
const _steveViewAppBarActionsPadding = paddingR16;
const _steveViewAppBarIconsSizeFactor = 0.5;
const _steveViewAppBarIconsSpacer = sizedBoxW8;

class SteveView extends StatelessWidget {
  const SteveView({
    super.key,
    required this.appBar,
    required this.slivers,
  });

  final SteveViewAppBar appBar;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appBarTitleStyle = theme.textTheme.displayLarge!;
    var appBarHeight = appBarTitleStyle.height! * appBarTitleStyle.fontSize! * _steveViewAppBarPaddingFactor;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: appBarHeight,
            toolbarHeight: appBarHeight,
            expandedHeight: appBarHeight * _steveViewAppBarExpansionFactor,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: _steveViewAppBarExpansionFactor,
              title: Text(appBar.title, style: appBarTitleStyle),
            ),
            actionsPadding: _steveViewAppBarActionsPadding,
            actionsIconTheme: IconThemeData(
              size: appBarHeight * _steveViewAppBarIconsSizeFactor,
            ),
            actions: CollectionUtil.intersperse(_steveViewAppBarIconsSpacer, appBar.actions).toList(),
          ),
          ...slivers,
        ],
      ),
    );
  }
}

const _steveViewActionDefaultScale = 1.0;
const _steveViewActionHoverScale = 1.314;
const _steveViewActionScaleAnimationDuration = durationMs100;
const _steveViewActionSplashBorder = roundedRectangleBorderC12;
const _steveViewActionPadding = paddingA6;

class SteveViewAction extends StatefulWidget {
  const SteveViewAction({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  State<SteveViewAction> createState() => _SteveViewActionState();
}

class _SteveViewActionState extends State<SteveViewAction> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var hoveredColor = theme.colorScheme.primary;
    return AnimatedScale(
      scale: _hovered ? _steveViewActionHoverScale : _steveViewActionDefaultScale,
      duration: _steveViewActionScaleAnimationDuration,
      child: InkWell(
        onTap: widget.onPressed,
        onHover: _updateHovered,
        hoverColor: colorTransparant,
        highlightColor: colorTransparant,
        customBorder: _steveViewActionSplashBorder,
        child: Padding(
          padding: _steveViewActionPadding,
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

class SteveViewAppBar {
  const SteveViewAppBar({
    required this.title,
    required this.actions,
  });

  final String title;
  final List<SteveViewAction> actions;
}
