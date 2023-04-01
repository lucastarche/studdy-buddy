import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Test 123"),
          ],
        ),
      ),
    );
  }
}
