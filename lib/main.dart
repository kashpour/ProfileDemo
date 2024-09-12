import 'package:flutter/material.dart';
import 'package:profile_demo/screens/home_screen.dart';
import 'package:profile_demo/screens/landing_screen.dart';
import 'package:profile_demo/screens/login_screen.dart';
import 'package:profile_demo/screens/settings_screen.dart';
import 'package:profile_demo/screens/signup_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      initialRoute: '/loginScreen',
      routes: {
        '/': (context) => const LandingScreen(),
        '/signupScreen': (context) => const SignupScreen(),
        '/loginScreen': (context) => const LoginScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/settingsScreen': (context) => const SettingsScreen(),
      },
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
