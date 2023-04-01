import 'package:flutter/material.dart';

class SettingsObject {
  final NetworkImage profilePicture;
  final String username;
  final String email;
  final bool restrictByInstitution;
  final List<String> subjects;
  final double maxDistance;
  final bool pushNotificationsEnabled;
  final bool emailNotificationsEnabled;

  const SettingsObject({
    required this.profilePicture,
    required this.username,
    required this.email,
    required this.subjects,
    required this.maxDistance,
    required this.restrictByInstitution,
    required this.pushNotificationsEnabled,
    required this.emailNotificationsEnabled,
  });
}
