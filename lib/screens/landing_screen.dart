import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: const DecorationImage(
                  image: AssetImage('./assets/yellowBackgroundPerson3.avif'),
                  fit: BoxFit.cover,
                )),
            child: const Text(""),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to the Profile Demo App\nPlease login if you already have an acouunt.\nOtherwise create a new account.",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        offset: Offset(1.0, 1.0),
                      )
                    ],
                    fontSize: 22.0,
                    letterSpacing: 1.0,
                    wordSpacing: 1.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signupScreen');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: AssetImage('./assets/signup-icon.webp'),
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/loginScreen');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: AssetImage(
                            './assets/login.png',
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
