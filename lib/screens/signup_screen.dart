import 'package:flutter/material.dart';
import 'package:profile_demo/models/http_helper.dart';
import 'package:profile_demo/models/user_info.dart';
import 'package:profile_demo/shared/custome_show_dialog.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  HttpHelper httpHelper = HttpHelper();
  bool isShownPassword = false;
  bool isCheckedBox = false;
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Join our Profile Demo app to get access to the new unlimited products.",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(height: 16.0),
                TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          )),
                      prefixIcon: const Icon(
                        Icons.email,
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
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      )),
                ),
                const SizedBox(height: 16.0),
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
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      value: isCheckedBox,
                      onChanged: (value) {
                        setState(() {
                          isCheckedBox = value!;
                        });
                      },
                    ),
                    const Text(
                      "I agree to the terms & conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        postUserData(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 3.0,
                        fixedSize: Size(width, 60),
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                const Text(
                  "Or Sign up with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
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
                const SizedBox(height: 40.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 5.0),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/loginScreen');
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future postUserData(BuildContext context) async {
    if (txtUsername.text.isNotEmpty &&
        txtEmail.text.isNotEmpty &&
        txtPassword.text.isNotEmpty) {
      if (isCheckedBox) {
        List<UserInfo> userData = await httpHelper.getData();
        bool isUsernameExsit =
            userData.any((user) => user.username == txtUsername.text);

        if (isUsernameExsit) {
          if (!context.mounted) return;
          customShowDialog(context, "Username exsit try another username!", 'OK');
        } else {
          UserInfo userInfo =
              UserInfo(txtUsername.text, txtEmail.text, txtPassword.text);

          await httpHelper.postData(userInfo);
          txtUsername.text = "";
          txtEmail.text = "";
          txtPassword.text = "";
          txtUsername.selection;
          if (!context.mounted) return;
          await customShowDialog(context, "Signed Up Sucssefuly", 'OK');
          if (!context.mounted) return;
          Navigator.pop(context);
        }
      } else {
        customShowDialog(
            context, "Please agree to the terms & conditions first", 'OK');
      }
    } else {
      customShowDialog(context, "Please Fill all the fields and try again!", 'OK');
    }
  }
}
