import 'package:flutter/material.dart';

class CustomeButtomNavigation extends StatelessWidget {
  final int index;
  const CustomeButtomNavigation({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        onTap: (int value) {
          if (value == 0) {
            Navigator.pushReplacementNamed(context, '/homeScreen');
          } else if (value == 1) {
            Navigator.pushReplacementNamed(context, '/settingsScreen');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ]);
  }
}
