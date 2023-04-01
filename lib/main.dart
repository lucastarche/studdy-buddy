import 'package:flutter/material.dart';
import 'package:studdy_buddy/chat/chat_page.dart';
import 'package:studdy_buddy/home/home.dart';
import 'package:studdy_buddy/routes.dart';
import 'package:studdy_buddy/settings/chat_settings.dart';

void main() {
  runApp(const StuddyBuddyApp());
}

class StuddyBuddyApp extends StatelessWidget {
  const StuddyBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studdy Buddy!',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home.name,
      routes: {
        Routes.home.name: (context) => HomePage(),
        Routes.settings.name: (context) => const SettingsPage(
              email: "ignacio@gmail.com",
              username: "ignaciocanta",
              profilePicture: NetworkImage("http://via.placeholder.com/64x64"),
              subjects: [
                "Analisis 1",
                "Analisis 2",
                "Analsis 3",
                "Analisis 4",
                "Analisis 5"
              ],
              maxDistance: 4,
              restrictByInstitution: false,
              pushNotificationsEnabled: true,
              emailNotificationsEnabled: true,
            ),
        Routes.chat.name: (context) => const ChatPage(),
      },
    );
  }
}
