import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:sfds/src/constants.dart";
import "package:sfds/src/theme/theme.dart";
import "package:sfds/src/util/collection_util.dart";
import "package:sfds/src/util/navigation_util.dart";
import "package:sfds/src/util/string_util.dart";
import "package:sfds/src/util/text_style_util.dart";
import "package:sfds/src/widget/utility.dart";

const _steveSliverBreadcrumbsPaddingFactor = 1.314;
const _steveSliverBreadcrumbsSpacing = 32.0;
const _steveSliverBreadcrumbsSeparator = "/";
const _steveSliverBreadcrumbsSeparatorPadding = paddingH8;

class SteveSliverBreadcrumbs extends StatelessWidget {
  const SteveSliverBreadcrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var themeExtension = theme.extension<ColorSchemeExtension>()!;
    var goRouter = GoRouter.of(context);
    var segments = _routingSegments(goRouter);
    var breadcrumbsStyle = theme.textTheme.labelLarge!;
    var breadcrumbsLinkStyle = breadcrumbsStyle.copyWith(
      color: themeExtension.hyperlink.color,
      decoration: TextDecoration.underline,
    );
    var breadcrumbsStyleHeight = TextStyleUtil.getTrueHeight(breadcrumbsStyle);
    var breadcrumbsHeight = breadcrumbsStyleHeight * _steveSliverBreadcrumbsPaddingFactor;
    var breadcrumbsVerticalPadding = (breadcrumbsHeight - breadcrumbsStyleHeight) / 2;
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: _steveSliverBreadcrumbsSpacing, vertical: breadcrumbsVerticalPadding),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: CollectionUtil.intersperse(
            const _SteveSliverBreadcrumbsSeparator(),
            _breadcrumbWidgets(segments, breadcrumbsStyle, breadcrumbsLinkStyle),
          ).toList(),
        ),
      ),
    );
  }

  List<String> _routingSegments(GoRouter goRouter) => goRouter.routerDelegate.currentConfiguration.fullPath
      .split("/") //
      .map((segment) => segment.replaceAll("_", " "))
      .where((segment) => segment.isNotEmpty)
      .toList();

  List<_SteveSliverBreadcrumb> _breadcrumbWidgets(List<String> segments, TextStyle style, TextStyle linkStyle) {
    var length = segments.length;
    var breadcrumbWidgets = <_SteveSliverBreadcrumb>[];
    for (var index = 0; index < length; index++) {
      breadcrumbWidgets.add(
        _SteveSliverBreadcrumb(
          segment: segments[index],
          style: index == length - 1 ? style : linkStyle,
          pops: length - (index + 1),
        ),
      );
    }
    return breadcrumbWidgets;
  }
}

class _SteveSliverBreadcrumbsSeparator extends StatelessWidget {
  const _SteveSliverBreadcrumbsSeparator();

  @override
  Widget build(BuildContext context) => const Padding(
    padding: _steveSliverBreadcrumbsSeparatorPadding,
    child: Text(_steveSliverBreadcrumbsSeparator),
  );
}

class _SteveSliverBreadcrumb extends StatelessWidget {
  const _SteveSliverBreadcrumb({
    required this.segment,
    required this.style,
    required this.pops,
  });

  final String segment;
  final TextStyle style;
  final int pops;

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);
    return ConditionalWidgetWrapper(
      condition: pops != 0,
      widgetWrapper: (child) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => NavigationUtil.popMultiple(navigator, pops),
          child: child,
        ),
      ),
      child: Text(StringUtil.capitalize(segment), style: style),
    );
  }
}

const _steveSliverTitleDefaultPadding = paddingH20V10;
const _steveSliverSubtitleDefaultPadding = paddingH22V11;

class SteveSliverTitle extends StatelessWidget {
  const SteveSliverTitle({
    super.key,
    required this.title,
    this.type = SteveSliverTitleType.title,
  });

  final String title;
  final SteveSliverTitleType type;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverPadding(
      padding: type.padding,
      sliver: SliverToBoxAdapter(
        child: Text(
          title,
          style: type.textStyleFunction.call(theme),
        ),
      ),
    );
  }
}

enum SteveSliverTitleType {
  title,
  subtitle,
}

extension SteveSliverTitleTypeTextStyle on SteveSliverTitleType {
  TextStyle Function(ThemeData theme) get textStyleFunction => switch (this) {
    SteveSliverTitleType.title => (theme) => theme.textTheme.displayMedium!,
    SteveSliverTitleType.subtitle => (theme) => theme.textTheme.displaySmall!,
  };

  EdgeInsets get padding => switch (this) {
    SteveSliverTitleType.title => _steveSliverTitleDefaultPadding,
    SteveSliverTitleType.subtitle => _steveSliverSubtitleDefaultPadding,
  };
}

const _steveSliverTextDefaultPadding = paddingH24V12;

class SteveSliverText extends StatelessWidget {
  const SteveSliverText({
    super.key,
    required this.text,
    this.textStyle,
  });

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: _steveSliverTextDefaultPadding,
    sliver: SliverToBoxAdapter(
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.justify,
      ),
    ),
  );
}

class SteveSliverSpacing extends StatelessWidget {
  const SteveSliverSpacing({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: SizedBox(height: height),
  );
}

const _steveSliverGridPadding = paddingH18;

class SteveSliverGrid extends StatelessWidget {
  const SteveSliverGrid({
    super.key,
    required this.children,
    required this.gridDelegate,
  });

  final List<Widget> children;
  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: _steveSliverGridPadding,
    sliver: SliverGrid.builder(
      gridDelegate: gridDelegate,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    ),
  );
}
