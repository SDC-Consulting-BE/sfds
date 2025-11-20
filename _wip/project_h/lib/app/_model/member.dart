import "package:flutter/material.dart";

class Member {
  const Member({
    required this.name,
    required this.displayName,
    required this.color,
  });

  final String name;
  final String displayName;
  final Color color;
}
