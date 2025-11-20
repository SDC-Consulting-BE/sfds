import "package:project_h/app/_model/member.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "member_provider.g.dart";

@riverpod
class ActiveMember extends _$ActiveMember {
  @override
  Member? build() => null;

  // ignore: use_setters_to_change_properties should not be applied to providers
  void selectMember(Member? member) => state = member;

  void clearSelectedMember() => state = null;
}
