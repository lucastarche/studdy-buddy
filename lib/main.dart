import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';
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
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Studdy Buddy!',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.home.name,
        routes: {
          Routes.home.name: (context) => const HomePage(),
          Routes.settings.name: (context) => const SettingsPage(),
          Routes.chat.name: (context) => const ChatPage(),
        },
      ),
    );
  }
}
