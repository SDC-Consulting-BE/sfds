import "package:cloud_firestore/cloud_firestore.dart";
import "package:project_h/app/_model/member.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "member_provider.g.dart";

@riverpod
Stream<List<Member>> membersStream(Ref ref) => FirebaseFirestore.instance
    .collection("members") //
    .snapshots()
    .map((snapshot) => snapshot.docs.map(Member.fromFirestore).toList());

@riverpod
class SelectedMember extends _$SelectedMember {
  @override
  String? build() => null;

  // ignore: use_setters_to_change_properties should not be applied to providers
  void selectMember(String? id) => state = id;

  void clearSelectedMember() => state = null;
}
