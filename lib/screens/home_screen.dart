import 'package:flutter/material.dart';
import 'package:profile_demo/shared/custome_buttom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomeButtomNavigation(index: 0),
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
