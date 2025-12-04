import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:sfds/util.dart";

part "member.g.dart";

class Member {
  Member({
    required this.id,
    required this.displayName,
    required this.color,
  });

  Member.fromFirestore(DocumentSnapshot doc) //
    : id = doc.id,
      displayName = doc.get("displayName") as String,
      color = SteveColorUtil.colorFromHexString(doc.get("color") as String);

  final String id;
  final String displayName;
  final Color color;
}

@riverpod
Stream<List<Member>> membersStream(Ref ref) => FirebaseFirestore.instance
    .collection("members") //
    .snapshots()
    .map((snapshot) => snapshot.docs.map(Member.fromFirestore).toList());
