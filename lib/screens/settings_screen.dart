import 'package:flutter/material.dart';
import 'package:profile_demo/main.dart';
import 'package:profile_demo/models/http_helper.dart';
import 'package:profile_demo/models/sp_helper.dart';
import 'package:profile_demo/models/user_info.dart';
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
  late bool isDarkMode;
  Map userData = {};
  int index = 1;

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPasswordDelete = TextEditingController();

  @override
  void initState() {
    spHelper.init();
    getUserPrefes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userData = userData.isNotEmpty
        ? userData
        : ModalRoute.of(context)!.settings.arguments as Map;
    final double width = MediaQuery.of(context).size.width;
    txtUsername.text = userData['username'];
    txtEmail.text = userData['email'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (isDarkMode) {
                isDarkMode = false;
                MyApp.of(context).changeTheme(ThemeMode.light);
              } else {
                isDarkMode = true;
                MyApp.of(context).changeTheme(ThemeMode.dark);
              }
              saveUserPrefs();
            });
          },
          icon: spHelper.getUserPrefes('isDarkMode')
              ? const Icon(
                  Icons.light_mode,
                  size: 32.0,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.dark_mode,
                  size: 32.0,
                  color: Colors.black,
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
                style: const TextStyle(
                  color: Colors.black,
                ),
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
                style: const TextStyle(
                  color: Colors.black,
                ),
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
                style: const TextStyle(
                  color: Colors.black,
                ),
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
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    deleteUserData(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 3.0,
                    fixedSize: Size(width, 60),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    "Delete Account",
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
      // bottomNavigationBar: const CustomeButtomNavigation(index: 1),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.amber[700],
          currentIndex: index,
          onTap: (int value) {
            if (value == 0) {
              Navigator.pushReplacementNamed(context, '/homeScreen',
                  arguments: {
                    'username': userData['username'],
                    'email': userData['email'],
                  });
            } else if (value == 1) {
              Navigator.pushReplacementNamed(context, '/settingsScreen');
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }

  Future postUserData(BuildContext context) async {
    UserInfo userInfo =
        UserInfo(txtUsername.text, txtEmail.text, txtPassword.text);
    await httpHelper.putData(userInfo);
    await spHelper.setUser(userInfo);
    if (!context.mounted) return;
    customShowDialog(context, 'Saved Updated Data', 'Ok');
    txtPassword.text = '';
  }

  Future deleteUserData(BuildContext context) async {
    TextField txtPassword = TextField(
      obscureText: true,
      controller: txtPasswordDelete,
      decoration: const InputDecoration(hintText: 'Password'),
    );
    await customShowDialog(
        context, 'Enter password to delete your account', 'Delete',
        txtPassword: txtPassword);
    if (txtPasswordDelete.text != '') {
      UserInfo user = await httpHelper.getUserData(txtUsername.text);
      if (txtPasswordDelete.text == user.password) {
        bool isSuccess = await httpHelper.deleteUserData(txtUsername.text);
        if (isSuccess) {
          if (!context.mounted) return;
          await customShowDialog(context, "Account Deleted Successfully", 'OK');
          if (!context.mounted) return;

          Navigator.pushReplacementNamed(context, '/');
        } else {
          if (!context.mounted) return;

          await customShowDialog(
              context, "Could Not Delete Account Please Try Again", 'OK');
        }
      } else {
        if (!context.mounted) return;
        customShowDialog(context, 'Wrong password! try again', 'OK');
      }
    } else {
      if (!context.mounted) return;
      customShowDialog(
          context, 'Please enter your password and try again', 'OK');
    }
    txtPasswordDelete.text = '';
  }

  void saveUserPrefs() async {
    await spHelper.setUserPrefes(isDarkMode);
  }

  void getUserPrefes() {
    isDarkMode = spHelper.getUserPrefes('isDarkMode') ?? false;
  }
}
