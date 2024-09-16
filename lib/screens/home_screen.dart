import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map userData = {};
  int index = 0;
  @override
  Widget build(BuildContext context) {
    userData = userData.isNotEmpty
        ? userData
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.amber[700],
          currentIndex: index,
          onTap: (int value) {
            if (value == 0) {
              Navigator.pushReplacementNamed(context, '/homeScreen');
            } else if (value == 1) {
              Navigator.pushReplacementNamed(context, '/settingsScreen',
                  arguments: {
                    'username': userData['username'],
                    'email': userData['email'],
                  });
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: const Text(
          "Profile Demo",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
