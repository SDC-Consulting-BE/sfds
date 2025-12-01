import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:sfds/util.dart";

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
