import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project_h/app/_model/household.dart";
import "package:project_h/app/_model/member.dart";
import "package:project_h/app/_provider/member_provider.dart";
import "package:project_h/app_constants.dart";
import "package:project_h/l10n/generated/app_localizations.dart";
import "package:sfds/util.dart";
import "package:sfds/widget.dart";

class MemberSelector extends ConsumerWidget {
  const MemberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localization = Localization.of(context);
    var householdStream = ref.watch(householdStreamProvider);
    var membersStream = ref.watch(membersStreamProvider);
    if (householdStream is AsyncError || membersStream is AsyncError) {
      if (householdStream is AsyncError) {
        unawaited(SteveTaskSchedulingUtil.scheduleMicrotask(context, () => SteveToast.showToast(context, .error, localization.dashboard_error_load_household)));
      }
      if (membersStream is AsyncError) {
        unawaited(SteveTaskSchedulingUtil.scheduleMicrotask(context, () => SteveToast.showToast(context, .error, localization.dashboard_error_load_members)));
      }
      return const _MemberSelector.error();
    }
    if (householdStream is AsyncLoading || membersStream is AsyncLoading) {
      return const _MemberSelector.loading();
    }
    return _MemberSelector.data(
      household: householdStream.value!,
      members: {for (var member in membersStream.value!) member.id: member},
    );
  }
}

class _MemberSelector extends ConsumerWidget {
  const _MemberSelector._({
    this.loading = false,
    this.error = false,
    this.household,
    this.members,
  });

  const _MemberSelector.loading()
    : this._(
        loading: true,
      );

  const _MemberSelector.error()
    : this._(
        error: true,
      );

  const _MemberSelector.data({
    required Household household,
    required Map<String, Member> members,
  }) : this._(
         household: household,
         members: members,
       );

  final bool loading;
  final bool error;
  final Household? household;
  final Map<String, Member>? members;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navigator = Navigator.of(context);
    var selectedMember = ref.watch(selectedMemberProvider);
    var selectedMemberNotifier = ref.watch(selectedMemberProvider.notifier);
    return SteveSliverViewAppBarDropDown(
      shimmer: loading,
      visual: _MemberSelectorVisual(
        loading: loading,
        error: error,
        member: members?[selectedMember],
      ),
      items: [
        if (error)
          ...[]
        else if (loading) ...[
          SteveSliverViewAppBarDropDownTile(
            shimmer: true,
            leading: iconMember,
            onTap: () {},
            title: "",
          ),
        ] else ...[
          if (selectedMember != null)
            _MemberTile.member(
              onTap: () {},
              selected: true,
              member: members![selectedMember]!,
            ),
          _MemberTile.household(
            onTap: () => _onHouseholdSelected(selectedMemberNotifier, navigator),
            selected: selectedMember == null,
            household: household!,
          ),
          ...members!.values
              .where((member) => member.id != selectedMember)
              .map(
                (member) => _MemberTile.member(
                  onTap: () => _onMemberSelected(selectedMemberNotifier, member, navigator),
                  selected: false,
                  member: member,
                ),
              ),
        ],
      ],
    );
  }

  void _onHouseholdSelected(
    SelectedMember selectedMemberNotifier,
    NavigatorState navigator,
  ) {
    selectedMemberNotifier.clearSelectedMember();
    navigator.pop();
  }

  void _onMemberSelected(
    SelectedMember selectedMemberNotifier,
    Member selectedMember,
    NavigatorState navigator,
  ) {
    selectedMemberNotifier.selectMember(selectedMember.id);
    navigator.pop();
  }
}

class _MemberSelectorVisual extends StatelessWidget {
  const _MemberSelectorVisual({
    this.loading = false,
    this.error = false,
    this.member,
  });

  final bool loading;
  final bool error;
  final Member? member;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (loading) {
      return iconMember;
    }
    if (error) {
      return SteveIconOverlay(
        icon: Icon(iconDataMember, color: theme.disabledColor),
        overlayIcon: Icon(iconDataX, color: theme.colorScheme.error),
      );
    }
    if (member == null) {
      return iconHousehold;
    }
    return Icon(
      iconDataMember,
      color: member!.color,
    );
  }
}

class _MemberTile extends SteveSliverViewAppBarDropDownTile {
  const _MemberTile._({
    super.key,
    required super.onTap,
    required super.selected,
    required super.title,
    required Icon icon,
  }) : super(
         leading: icon,
       );

  _MemberTile.member({
    Key? key,
    required VoidCallback onTap,
    required bool selected,
    required Member member,
  }) : this._(
         key: key,
         onTap: onTap,
         selected: selected,
         title: member.displayName,
         icon: Icon(
           iconDataMember,
           color: member.color,
         ),
       );

  _MemberTile.household({
    Key? key,
    required VoidCallback onTap,
    required bool selected,
    required Household household,
  }) : this._(
         key: key,
         onTap: onTap,
         selected: selected,
         title: household.name,
         icon: iconHousehold,
       );
}
