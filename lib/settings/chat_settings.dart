import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';

import '../components/app_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final settings = state.sobj;

    return AppScaffold(
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
                  backgroundImage: settings.profilePicture,
                  radius: 32.0,
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      settings.username,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(settings.email),
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
              value: settings.restrictByInstitution,
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
              children: [
                ...settings.subjects.map((subject) {
                  return Chip(
                    label: Text(subject),
                    onDeleted: () {
                      // TODO: implement remove subject
                    },
                  );
                }),
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: SizedBox(
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Add a subject'),
                              content: DropdownButton<String>(
                                isExpanded: true,
                                value: null,
                                onChanged: (String? value) {
                                  // TODO: add the selected subject
                                },
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'Math',
                                    child: Text('Math'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Science',
                                    child: Text('Science'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'History',
                                    child: Text('History'),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO: add the selected subject
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Add'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(16.0),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
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
              label: '$settings.maxDistance km',
              value: settings.maxDistance,
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
              value: settings.pushNotificationsEnabled,
              onChanged: (value) {
                // TODO: implement toggle for pushNotificationsEnabled
              },
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Email Notifications'),
              value: settings.emailNotificationsEnabled,
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
