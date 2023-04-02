import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:studdy_buddy/firebase_options.dart';
import 'package:image_network/image_network.dart';
import '../routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final headingStyle = theme.textTheme.headlineMedium;
    final loginTextStyle = theme.textTheme.titleLarge;

    return AuthStateListener<OAuthController>(
      listener: (oldState, state, controller) {
        if (state is SignedIn || state is UserCreated) {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            Navigator.pushReplacementNamed(context, Routes.home.name);
            _showUserInfoDialog(context, user);
          }
          //Navigator.pushReplacementNamed(context, Routes.home.name);
        }
        return null;
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenido a Studdy Buddy!",
              style: headingStyle,
            ),
            const SizedBox(height: 32),
            Text(
              "Inicia sesión para continuar",
              style: loginTextStyle,
            ),
            const SizedBox(height: 40),
            OAuthProviderButton(
              key: const Key('oauth-button'),
              provider: GoogleProvider(clientId: googleClientID),
            ),
          ],
        ),
      ),
    );
  }

  void _showUserInfoDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Information'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image(image: NetworkImage(user.photoURL ?? ''))),
                const SizedBox(height: 16),
                Text('Name: ${user.displayName ?? "N/A"}'),
                Text('Email: ${user.email ?? "N/A"}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
