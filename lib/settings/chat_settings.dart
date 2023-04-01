import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final NetworkImage profilePicture;
  final String username;
  final String email;
  final bool restrictByInstitution;
  final List<String> subjects;
  final double maxDistance;
  final bool pushNotificationsEnabled;
  final bool emailNotificationsEnabled;

  const SettingsPage({
    Key? key,
    required this.profilePicture,
    required this.username,
    required this.email,
    required this.subjects,
    required this.maxDistance,
    required this.restrictByInstitution,
    required this.pushNotificationsEnabled,
    required this.emailNotificationsEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: profilePicture,
                  radius: 32.0,
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(email),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Restrict by Institution'),
              subtitle:
                  const Text('Only match with users from the same institution'),
              value: restrictByInstitution,
              onChanged: (value) {
                // TODO: implement toggle for restrictByInstitution
              },
            ),
            const SizedBox(height: 16.0),
            Text(
              'Subjects',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: subjects.map((subject) {
                return Chip(
                  label: Text(subject),
                  onDeleted: () {
                    // TODO: implement remove subject
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Max Distance',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Slider(
              min: 0,
              max: 50,
              divisions: 10,
              label: '$maxDistance km',
              value: maxDistance,
              onChanged: (value) {
                // TODO: implement set maxDistance
              },
            ),
            const SizedBox(height: 32.0),
            Text(
              'Notifications',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Push Notifications'),
              value: pushNotificationsEnabled,
              onChanged: (value) {
                // TODO: implement toggle for pushNotificationsEnabled
              },
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Email Notifications'),
              value: emailNotificationsEnabled,
              onChanged: (value) {
                // TODO: implement toggle for emailNotificationsEnabled
              },
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
