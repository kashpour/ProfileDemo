class UserInfo {
  String id = "";
  String username = "";
  String email = "";
  String password = "";

  UserInfo(this.username, this.email, this.password);

  UserInfo.fromJson(Map<String, dynamic> userData) {
    id = userData['id'] ?? '';
    username = userData['username'] ?? '';
    email = userData['email'] ?? '';
    password = userData['password'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': username,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
