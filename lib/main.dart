import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';
import 'package:studdy_buddy/chat/chat_page.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';
import 'package:studdy_buddy/home/home.dart';
import 'package:studdy_buddy/login/login.dart';
import 'package:studdy_buddy/routes.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    GoogleProvider(
      clientId: googleClientID,
    ),
  ]);

  runApp(ChangeNotifierProvider<ApplicationState>(
    create: (context) => ApplicationState(),
    child: const StuddyBuddyApp(),
  ));
}

class StuddyBuddyApp extends StatelessWidget {
  const StuddyBuddyApp({super.key});

  String get initialRoute {
    final auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      return Routes.home.name;
    } else {
      return Routes.login.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studdy Buddy!',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      routes: {
        Routes.login.name: (context) => const LoginPage(),
        Routes.home.name: (context) => const HomePage(),
        Routes.settings.name: (context) => const AppScaffold(),
        Routes.chat.name: (context) => const ChatPage(),
      },
    );
  }
}
