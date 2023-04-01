import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';
import 'package:studdy_buddy/home/home.dart';
import 'package:studdy_buddy/routes.dart';

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
        Routes.home.name: (context) => const HomePage(),
        Routes.settings.name: (context) => const AppScaffold(),
        Routes.chat.name: (context) => const AppScaffold(),
      },
    );
  }
}
