import "package:flutter/material.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/util/collection_util.dart";
import "package:sfds/src/util/text_style_util.dart";
import "package:sfds/src/widget/shimmer.dart";
import "package:sfds/src/widget/text.dart";
import "package:sfds/src/widget/utility.dart";

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
    this.pinned = true,
    this.showBackNavigation = false,
    this.actions = const [],
  });

  final String title;
  final bool pinned;
  final bool showBackNavigation;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appBarTitleStyle = theme.textTheme.displayLarge!;
    var appBarTitleStyleHeight = SteveTextStyleUtil.getTrueHeight(appBarTitleStyle);
    var appBarHeight = appBarTitleStyleHeight * _steveSliverViewAppBarPaddingFactor;
    var appBarVerticalPadding = (appBarHeight - appBarTitleStyleHeight) / 2;
    return SliverAppBar(
      pinned: pinned,
      collapsedHeight: appBarHeight,
      toolbarHeight: appBarHeight,
      expandedHeight: appBarHeight * _steveSliverViewAppBarExpansionFactor,
      leading: sizedBoxZero,
      titleSpacing: -40,
      title: showBackNavigation
          ? SteveSliverViewAppBarAction(
              icon: Icons.chevron_left,
              onPressed: Navigator.of(context).pop,
            )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: .symmetric(horizontal: _steveSliverViewAppBarHorizontalSpacing, vertical: appBarVerticalPadding),
        expandedTitleScale: _steveSliverViewAppBarExpansionFactor,
        title: Text(title, style: appBarTitleStyle),
        centerTitle: true,
      ),
      actionsPadding: const .only(right: _steveSliverViewAppBarHorizontalSpacing),
      actionsIconTheme: IconThemeData(
        size: appBarHeight * _steveSliverViewAppBarIconsSizeFactor,
      ),
      actions: SteveCollectionUtil.intersperse(_steveSliverViewAppBarIconsSpacer, actions).toList(),
    );
  }
}

class SteveSliverViewAppBarAction extends StatelessWidget {
  const SteveSliverViewAppBarAction({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => _SteveSliverViewAppBarAction(
    onPressed: onPressed,
    child: Icon(icon),
  );
}

class SteveSliverViewAppBarDropDown extends StatelessWidget {
  const SteveSliverViewAppBarDropDown({
    super.key,
    this.shimmer = false,
    required this.visual,
    required this.items,
  });

  final bool shimmer;
  final Widget visual;
  final Iterable<SteveSliverViewAppBarDropDownTile> items;

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey();
    return _SteveSliverViewAppBarAction(
      boxKey: key,
      onPressed: () => _showSelectionDialog(context, key),
      child: SteveConditionalWidgetWrapper(
        condition: shimmer,
        widgetWrapper: (child) => SteveShimmer(child: child),
        child: visual,
      ),
    );
  }

  Future<void> _showSelectionDialog(
    BuildContext context,
    GlobalKey key,
  ) async {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => _SteveSliverViewAppBarDropDownDialog(
        callersRenderBox: key.currentContext!.findRenderObject()! as RenderBox,
        items: items,
      ),
    );
  }
}

const _steveSliverViewAppBarDropDownTileSelectedIconSize = 24.0;

class SteveSliverViewAppBarDropDownTile extends StatelessWidget {
  const SteveSliverViewAppBarDropDownTile({
    super.key,
    this.dense = false,
    this.selected = false,
    this.shimmer = false,
    required this.onTap,
    required this.leading,
    required this.title,
    this.subtitle,
  });

  final bool dense;
  final bool selected;
  final bool shimmer;
  final VoidCallback? onTap;
  final Widget leading;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) => SteveConditionalWidgetWrapper(
    condition: shimmer,
    widgetWrapper: (child) => SteveShimmer(child: child),
    child: ListTile(
      dense: dense,
      enabled: !selected,
      leading: leading,
      onTap: onTap,
      title: shimmer ? const TextPlaceholder() : Text(title),
      subtitle: subtitle != null ? (shimmer ? const TextPlaceholder() : Text(subtitle!)) : null,
      trailing: selected
          ? const Icon(
              iconDataSelected,
              size: _steveSliverViewAppBarDropDownTileSelectedIconSize,
            )
          : null,
    ),
  );
}

class _SteveSliverViewAppBarDropDownDialog extends StatelessWidget {
  const _SteveSliverViewAppBarDropDownDialog({
    required this.callersRenderBox,
    required this.items,
  });

  final RenderBox callersRenderBox;
  final Iterable<SteveSliverViewAppBarDropDownTile> items;

  @override
  Widget build(BuildContext context) {
    var callersOffset = callersRenderBox.localToGlobal(Offset.zero);
    var mediaQuery = MediaQuery.of(context);
    return Dialog(
      alignment: .topRight,
      insetPadding: .only(
        top: callersOffset.dy,
        right: (mediaQuery.size.width - callersOffset.dx) - _steveSliverViewActionSize - _steveSliverViewActionPadding.horizontal,
      ),
      child: SizedBox(
        width: 0,
        child: Column(
          mainAxisSize: .min,
          children: SteveCollectionUtil.intersperse(divider, items).toList(),
        ),
      ),
    );
  }
}

const _steveSliverViewActionDefaultScale = 1.0;
const _steveSliverViewActionHoverScale = 1.314;
const _steveSliverViewActionScaleAnimationDuration = durationMs100;
const _steveSliverViewActionSplashBorder = roundedRectangleBorderC12;
const _steveSliverViewActionPadding = paddingA6;
const _steveSliverViewActionSize = 42.0;

class _SteveSliverViewAppBarAction extends StatefulWidget {
  const _SteveSliverViewAppBarAction({
    this.boxKey,
    required this.onPressed,
    required this.child,
  });

  final GlobalKey? boxKey;
  final VoidCallback onPressed;
  final Widget child;

  @override
  State<_SteveSliverViewAppBarAction> createState() => _SteveSliverViewAppBarActionState();
}

class _SteveSliverViewAppBarActionState extends State<_SteveSliverViewAppBarAction> {
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
            fit: .fitHeight,
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
