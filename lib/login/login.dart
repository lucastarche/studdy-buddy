import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:studdy_buddy/firebase_options.dart';
import '../routes.dart';
import 'package:provider/provider.dart';
import 'package:studdy_buddy/app_state.dart';

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
            final state = Provider.of<AppState>(context, listen: false);
            state.updateUserInformation(context, user);
          }
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
            SizedBox(
              width: 250,
              child: OAuthProviderButton(
                key: const Key('oauth-button'),
                provider: GoogleProvider(clientId: googleClientID),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
