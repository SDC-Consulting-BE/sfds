import "package:riverpod_annotation/riverpod_annotation.dart";

part "member_provider.g.dart";

@riverpod
class SelectedMember extends _$SelectedMember {
  @override
  String? build() => null;

  // ignore: use_setters_to_change_properties should not be applied to providers
  void selectMember(String? id) => state = id;

  void clearSelectedMember() => state = null;
}
