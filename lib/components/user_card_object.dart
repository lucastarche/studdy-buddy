import 'package:flutter/material.dart';

class UserCardObject {
  final String name;
  final Image pfp;
  final String description;
  final List prosArray;
  final List<List<int>> schedule;

  const UserCardObject(
      {required this.name,
      required this.pfp,
      required this.description,
      required this.prosArray,
      required this.schedule});
}
