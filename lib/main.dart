import 'package:flutter/material.dart';
import 'package:profile_demo/screens/home_screen.dart';
import 'package:profile_demo/screens/landing_screen.dart';
import 'package:profile_demo/screens/login_screen.dart';
import 'package:profile_demo/screens/signup_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/signupScreen': (context) => const SignupScreen(),
        '/loginScreen': (context) => const LoginScreen(),
        '/homeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
