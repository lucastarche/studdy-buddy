import 'package:flutter/material.dart';

import '../routes.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)!.settings.name;
    final selectedIndex = _getSelectedIndex(route!);

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat"),
      ],
      onTap: (index) =>
          Navigator.popAndPushNamed(context, Routes.values[index].name),
      currentIndex: selectedIndex,
    );
  }

  int _getSelectedIndex(String route) {
    for (final currentRoute in Routes.values) {
      if (currentRoute.name == route) {
        return currentRoute.index;
      }
    }

    return Routes.home.index;
  }
}
