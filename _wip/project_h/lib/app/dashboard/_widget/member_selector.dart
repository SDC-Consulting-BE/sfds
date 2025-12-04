import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project_h/app/_model/household.dart";
import "package:project_h/app/_model/member.dart";
import "package:project_h/app/_provider/member_provider.dart";
import "package:project_h/app_constants.dart";
import "package:sfds/widget.dart";

class MemberSelector extends ConsumerWidget {
  const MemberSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var householdStream = ref.watch(householdStreamProvider);
    var membersStream = ref.watch(membersStreamProvider);
    if (householdStream is AsyncError || membersStream is AsyncError) {
      // TODO(sdecleene): toaster implementation!
      return const _MemberSelector.loading();
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
    this.household,
    this.members,
  });

  const _MemberSelector.loading()
    : this._(
        loading: true,
      );

  const _MemberSelector.data({
    required Household household,
    required Map<String, Member> members,
  }) : this._(
         household: household,
         members: members,
       );

  final bool loading;
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
        member: members?[selectedMember],
      ),
      items: loading
          ? [
              SteveSliverViewAppBarDropDownTile(
                shimmer: true,
                leading: iconMember,
                onTap: () {},
                title: "",
              ),
            ]
          : [
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
    required this.loading,
    this.member,
  });

  final bool loading;
  final Member? member;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return iconMember;
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
