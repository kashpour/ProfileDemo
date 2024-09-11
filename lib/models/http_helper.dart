import 'package:http/http.dart' as http;
import 'package:profile_demo/models/user_info.dart';
import 'dart:convert';

class HttpHelper {
  String url = "http://localhost:3000/users";

  Future<List<UserInfo>> getData() async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    List<UserInfo> users = [];
    var jsonData = jsonDecode(response.body) as List;
    jsonData.map((user) {
      users.add(UserInfo.fromJson(user));
    }).toList();
    return users;
  }

  Future<UserInfo> getUserData(String username) async {
    try {
      if (username != '') {
        Uri uri = Uri.parse('$url/$username');
        http.Response response = await http.get(uri);
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          UserInfo user = UserInfo.fromJson(jsonData);
          return user;
        }
      }
    } catch (e) {
      rethrow;
    }
    return UserInfo('', '', '');
  }

  Future postData(UserInfo userInfo) async {
    Uri uri = Uri.parse(url);
    http.Response response =
        await http.post(uri, body: jsonEncode(userInfo.toJson()));
    return response;
  }
}
