class UserModel {
  String? username;
  String? password;

  UserModel({this.username, this.password});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      username: data['username'],
      password: data['password'],
    );
  }
}