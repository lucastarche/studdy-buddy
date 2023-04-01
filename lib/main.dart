import 'package:flutter/material.dart';
import 'package:studdy_buddy/chat/chat_page.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';
import 'package:studdy_buddy/home/home.dart';
import 'package:studdy_buddy/routes.dart';
<<<<<<< HEAD
import 'package:studdy_buddy/settings/chat_settings.dart';
=======
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
>>>>>>> 5aad56bc5b5476503254c7ab7b51dee81a388eb9

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
        Routes.home.name: (context) => const HomePage(),
        Routes.settings.name: (context) => const SettingsPage(
              email: "ignacio@gmail.com",
              username: "ignaciocanta",
              profilePicture: NetworkImage("http://via.placeholder.com/64x64"),
            ),
        Routes.chat.name: (context) => const ChatPage(),
      },
    );
  }
}
