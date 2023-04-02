import 'package:flutter/material.dart';
import 'package:studdy_buddy/components/bottom_navigation_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;

  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: const CustomNavigationBar(),
      appBar: appBar,
    );
  }
}
