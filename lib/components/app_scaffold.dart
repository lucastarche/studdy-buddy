import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/bottom_navigation_bar.dart';

import '../routes.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  const AppScaffold({
    super.key,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: CustomNavigationBar(
        onNavigate: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, Routes.settings.name);
          } else if (index == 1) {
            Navigator.pushNamed(context, Routes.home.name);
          } else if (index == 2) {
            Navigator.pushNamed(context, Routes.chat.name);
          }
        },
      ),
    );
  }
}
