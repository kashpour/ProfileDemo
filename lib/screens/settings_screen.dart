import 'package:flutter/material.dart';
import 'package:profile_demo/models/http_helper.dart';
import 'package:profile_demo/models/sp_helper.dart';
import 'package:profile_demo/models/user_info.dart';
import 'package:profile_demo/shared/custome_buttom_navigation.dart';
import 'package:profile_demo/shared/custome_show_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SpHelper spHelper = SpHelper();

  HttpHelper httpHelper = HttpHelper();
  bool isShownPassword = false;
  bool isDarkMode = false;
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    spHelper.init();
    setUserToTxt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (isDarkMode) {
                isDarkMode = false;
              } else {
                isDarkMode = true;
              }
            });
          },
          icon: isDarkMode
              ? const Icon(
                  Icons.dark_mode,
                  size: 32.0,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.light_mode,
                  size: 32.0,
                  color: Colors.white,
                ),
        ),
        actions: [
          TextButton.icon(
              iconAlignment: IconAlignment.end,
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.red[900],
                size: 34.0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              label: const Text(''))
        ],
        backgroundColor: Colors.amber[600],
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    updateUserData();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 3.0,
                    fixedSize: Size(width, 60),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: const CustomeButtomNavigation(index: 1),
    );
  }

  Future setUserToTxt() async {
    List<String> userData = await spHelper.getUser('ibrahim');
    if (userData.isNotEmpty) {
      txtUsername.text = userData[0];
      txtEmail.text = userData[1];
    }
  }

  Future updateUserData() async {
    UserInfo userInfo =
        UserInfo(txtUsername.text, txtEmail.text, txtPassword.text);
    await httpHelper.putData(userInfo);
    await spHelper.setUser(userInfo);
    customShowDialog(context, 'Saved Updated Data');
    txtPassword.text = '';
  }

  // void updateScreen() async {
  //   setState(() {

  //   });
  // }
}
