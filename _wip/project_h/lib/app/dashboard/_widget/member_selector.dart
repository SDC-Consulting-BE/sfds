import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project_h/app/_mockdata/household.dart";
import "package:project_h/app/_model/household.dart";
import "package:project_h/app/_model/member.dart";
import "package:project_h/app/_provider/member_provider.dart";
import "package:project_h/app/_widget/progess_indicator_2.dart";
import "package:project_h/app_constants.dart";
import "package:sfds/widget.dart";

class _MemberSelector extends StatelessWidget {
  const _MemberSelector({
    required this.loading,
  });

  final bool loading;

  @override
  Widget build(BuildContext context) => SteveSliverViewAppBarDropDown(
    visual: const DustBrushIndicator(),
    items: [
      SteveSliverViewAppBarDropDownTile(
        shimmer: true,
        leading: iconHousehold,
        onTap: () {},
        title: "Loading...",
      ),
    ],
  );
}

class MemberSelector extends ConsumerWidget {
  const MemberSelector({super.key});

  Widget build2(
    BuildContext context,
    List<Member> members,
    String? selectedMember,
  ) {
    return Placeholder();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var membersStream = ref.watch(membersStreamProvider);
    var selectedMember = ref.read(selectedMemberProvider);
    return membersStream.when(
      loading: () => const _MemberSelector(loading: true),
      data: (members) => const _MemberSelector(loading: true),
      error: (error, stackTrace) {
        print("ERROR (TOASTR!): $error - $stackTrace");
        return const _MemberSelector(loading: true);
      },
    );
    // var memberSelector = ref.read(activeMemberProvider.notifier);
    // var currentMember = ref.watch(activeMemberProvider);
    // var nonCurrentMembers = members.where((member) => currentMember != member);
    // var navigator = Navigator.of(context);
    // return SteveSliverViewAppBarDropDown(
    //   visual: _MemberSelectorVisual(member: currentMember),
    //   items: [
    //     if (currentMember != null)
    //       _MemberListTile(
    //         onTap: () {},
    //         selected: true,
    //         member: currentMember,
    //       ),
    //     _HouseHoldListTile(
    //       household: household,
    //       onTap: currentMember == null
    //           ? null
    //           : () {
    //               memberSelector.clearSelectedMember();
    //               navigator.pop();
    //             },
    //       selected: currentMember == null,
    //     ),
    //     ...nonCurrentMembers.map(
    //       (member) => _MemberListTile(
    //         onTap: () {
    //           memberSelector.selectMember(member);
    //           navigator.pop();
    //         },
    //         selected: false,
    //         member: member,
    //       ),
    //     ),
    //   ],
    // );
  }
}

class _MemberSelectorVisual extends StatelessWidget {
  const _MemberSelectorVisual({
    this.member,
  });

  final Member? member;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (member == null) ...[
        iconHousehold,
        Text(household.name),
      ],
      if (member != null) ...[
        Icon(
          iconDataMember,
          color: member!.color,
        ),
        Text(member!.displayName),
      ],
    ],
  );
}

class _MemberListTile extends SteveSliverViewAppBarDropDownTile {
  _MemberListTile({
    required super.onTap,
    required super.selected,
    required Member member,
  }) : super(
         dense: true,
         leading: Icon(
           iconDataMember,
           color: member.color,
         ),
         title: member.id,
         subtitle: member.displayName,
       );
}

class _HouseHoldListTile extends SteveSliverViewAppBarDropDownTile {
  _HouseHoldListTile({
    required super.onTap,
    required super.selected,
    required Household household,
  }) : super(
         dense: false,
         leading: iconHousehold,
         title: household.name,
       );
}
