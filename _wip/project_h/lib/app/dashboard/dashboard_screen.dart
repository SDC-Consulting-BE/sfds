import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project_h/app/_model/member.dart";
import "package:project_h/app/_provider/member_provider.dart";
import "package:project_h/app/dashboard/_widget/member_selector.dart";
import "package:project_h/app/dashboard/_widget/overdue_task_card.dart";
import "package:project_h/l10n/generated/app_localizations.dart";
import "package:sfds/widget.dart";

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localization = Localization.of(context);
    var activeMember = ref.watch(activeMemberProvider);
    return SteveSliverView(
      appBar: SteveSliverViewAppBar(
        title: localization.dashboard,
        showBackNavigation: true,
        actions: const [
          MemberSelector(),
          SteveSliverViewAppBarActionLocaleSwitcher(supportedLocales: Localization.supportedLocales),
          SteveSliverViewAppBarActionThemeSwitcher(),
        ],
      ),
      slivers: [
        if (activeMember != null) ..._personalTasksSegment(activeMember),
        ..._overdueTasksSegment(localization),
        ..._taskSummarySegment(localization),
      ],
    );
  }

  List<Widget> _personalTasksSegment(
    Member member,
  ) => [
    SteveSliverTitle(title: "${member.displayName}'s tasks"),
    const _OverdueTasksGrid(),
  ];

  List<Widget> _overdueTasksSegment(Localization localization) => [
    SteveSliverTitle(title: localization.dashboard_overdue_tasks),
    const _OverdueTasksGrid(),
  ];

  List<Widget> _taskSummarySegment(Localization localization) => [
    SteveSliverTitle(title: localization.dashboard_task_summary),
    const _TaskSummaryGrid(),
  ];
}

class _OverdueTasksGrid extends StatelessWidget {
  const _OverdueTasksGrid();

  @override
  Widget build(BuildContext context) => SteveSliverGrid(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 450,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 5,
    ),
    children: List.generate(
      9,
      (_) => const OverdueTaskCard(),
    ),
  );
}

class _TaskSummaryGrid extends StatelessWidget {
  const _TaskSummaryGrid();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SteveSliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 600,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2,
      ),
      children: List.generate(
        18,
        (_) => DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: .circular(12),
            gradient: LinearGradient(
              begin: .topLeft,
              end: .bottomRight,
              colors: [theme.colorScheme.secondaryContainer, theme.colorScheme.tertiaryContainer],
            ),
          ),
        ),
      ),
    );
  }
}
