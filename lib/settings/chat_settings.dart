import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';

class SettingsPage extends StatelessWidget {
  final NetworkImage profilePicture;
  final String username;
  final String email;

  const SettingsPage({
    super.key,
    required this.profilePicture,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: profilePicture,
                  radius: 32.0,
                )
              ],
            ),
            Row(
              children: [
                Text(username),
              ],
            ),
            Row(
              children: [
                Text(email),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
