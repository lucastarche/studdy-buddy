import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';
import 'package:studdy_buddy/components/heatmap.dart';

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
            Center(
              child: SizedBox(
                child: CalendarHeatMap(data: state.schedule),
                width: 500,
                height: 500,
              ),
            ),
            DaySlotPicker(
              onSelection: state.toggleSlot,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Subjects',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
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
                ElevatedButton(
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
                            items: [
                              DropdownMenuItem<String>(
                                value: 'Math',
                                child: const Text('Math'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Science',
                                child: const Text('Science'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'History',
                                child: const Text('History'),
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
                  child: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
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

class DaySlotPicker extends StatefulWidget {
  final void Function(String day, int slot) onSelection;

  const DaySlotPicker({Key? key, required this.onSelection}) : super(key: key);

  @override
  _DaySlotPickerState createState() => _DaySlotPickerState();
}

class _DaySlotPickerState extends State<DaySlotPicker> {
  String? _selectedDay;
  int? _selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showPicker(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          _selectedDay != null && _selectedSlot != null
              ? '$_selectedDay - Slot $_selectedSlot'
              : 'Tap to add a free slot',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select day and slot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedDay,
                items: [
                  DropdownMenuItem(child: Text('Lunes'), value: 'Lunes'),
                  DropdownMenuItem(child: Text('Martes'), value: 'Martes'),
                  DropdownMenuItem(
                      child: Text('Miercoles'), value: 'Miercoles'),
                  DropdownMenuItem(child: Text('Jueves'), value: 'Jueves'),
                  DropdownMenuItem(child: Text('Viernes'), value: 'Viernes'),
                  DropdownMenuItem(child: Text('Sabado'), value: 'Sabado'),
                  DropdownMenuItem(child: Text('Domingo'), value: 'Domingo'),
                ],
                hint: Text('Select day'),
                onChanged: (value) {
                  setState(() {
                    _selectedDay = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: _selectedSlot,
                items: List.generate(24, (index) => index + 1)
                    .map((slot) => DropdownMenuItem(
                          child: Text('$slot'),
                          value: slot,
                        ))
                    .toList(),
                hint: Text('Select slot'),
                onChanged: (value) {
                  setState(() {
                    _selectedSlot = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_selectedDay != null && _selectedSlot != null) {
                  widget.onSelection(_selectedDay!, _selectedSlot!);
                  Navigator.pop(context);
                }
              },
              child: Text('Select'),
            ),
          ],
        );
      },
    );
  }
}
