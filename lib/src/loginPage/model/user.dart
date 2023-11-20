class User {
  late String id;
  late String user;
  late String password;

  User({required this.id, required this.user, required this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['userName'];
    password = json['password'];
  }
}
