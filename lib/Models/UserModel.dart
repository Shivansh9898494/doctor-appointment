class UserModel {

  final String username;
  final String email;
  final String password;
  final String dateOfBirth;
  final String gender;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": username,
      "email": email,
      "password": password,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
    };
  }
}

/*class UserModel {
  String? username;
  String? password;

  UserModel({this.username, this.password});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      username: data['username'],
      password: data['password'],
    );
  }
}*/