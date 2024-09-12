import 'package:flutter/material.dart';
import 'package:profile_demo/models/http_helper.dart';
import 'package:profile_demo/models/sp_helper.dart';
import 'package:profile_demo/models/user_info.dart';
import 'package:profile_demo/shared/custome_show_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SpHelper spHelper = SpHelper();

  HttpHelper httpHelper = HttpHelper();
  bool isShownPassword = false;
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  void initState() {
    super.initState();
    spHelper.init();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 32.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Log In",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              "Login to our Profile Demo app to get access to the new unlimited products.",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Column(
              children: [
                TextField(
                  controller: txtUsername,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          )),
                      prefixIcon: const Icon(
                        Icons.person_3,
                        color: Colors.green,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          )),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      )),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: txtPassword,
                  obscureText: !isShownPassword,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          )),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isShownPassword) {
                                isShownPassword = false;
                              } else {
                                isShownPassword = true;
                              }
                            });
                          },
                          icon: isShownPassword
                              ? const Icon(
                                  Icons.remove_red_eye,
                                )
                              : Image.asset(
                                  width: 40.0,
                                  height: 40.0,
                                  './assets/show_password.jpg',
                                  fit: BoxFit.cover,
                                )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          )),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      )),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                getUserData(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 3.0,
                fixedSize: Size(width, 60),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Or Log in with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage('./assets/google_logo.png'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage('./assets/facebook_logo.png'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage('./assets/x_logo.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 5.0),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signupScreen');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future getUserData(BuildContext context) async {
    UserInfo userInfo = await httpHelper.getUserData(txtUsername.text);
    if (userInfo.username != '') {
      if (userInfo.username == txtUsername.text &&
          userInfo.password == txtPassword.text) {
        spHelper.setUser(userInfo);
        if (!context.mounted) return;
        await customShowDialog(context, "Loged in Successfully");
        if (!context.mounted) return;
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/homeScreen');
      } else {
        if (!context.mounted) return;
        customShowDialog(context, "incorrect username or password! ");
      }
    } else {
      if (!context.mounted) return;
      customShowDialog(context, "Username not found!");
    }
  }
}
