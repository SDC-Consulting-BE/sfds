import "package:cloud_firestore/cloud_firestore.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "household.g.dart";

class Household {
  const Household({
    required this.name,
  });

  Household.fromFirestore(DocumentSnapshot doc) //
    : name = doc.get("name") as String;

  final String name;
}

@riverpod
Stream<Household> householdStream(Ref ref) => FirebaseFirestore.instance
    .collection("household") //
    .snapshots()
    .map((snapshot) => snapshot.docs.map(Household.fromFirestore).first);
