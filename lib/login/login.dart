import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studdy_buddy/firebase_options.dart';

import '../routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final heading = theme.textTheme.headlineLarge;
    final loginText = theme.textTheme.headlineSmall;

    return AuthStateListener<OAuthController>(
      listener: ((oldState, state, controller) {
        if (state is SignedIn || state is UserCreated) {
          Navigator.pushReplacementNamed(context, Routes.home.name);
        }

        return null;
      }),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenido a Studdy Buddy!",
              style: heading,
            ),
            const SizedBox(height: 32),
            Text(
              "Inicia sesión para continuar",
              style: loginText,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 320,
              child: OAuthProviderButton(
                provider: GoogleProvider(clientId: googleClientID),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
