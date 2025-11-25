import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class Member {
  Member({
    required this.id,
    required this.displayName,
    required this.color,
  });

  Member.fromFirestore(DocumentSnapshot doc) //
    : id = doc.id,
      displayName = doc.get("displayName") as String,
      color = Colors.red;

  final String id;
  final String displayName;
  final Color color;
}
