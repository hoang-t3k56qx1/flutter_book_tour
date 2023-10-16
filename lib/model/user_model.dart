class User {
  final int uid;
  final String username;
  final String password;
  final String name;
  final String email;
  final String avt;

  User({
    required this.uid,
    required this.username,
    required this.password,
    required this.name,
    required this.email,
    required this.avt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      username: json['username'],
      password: json['password'],
      name: json['name'],
      email: json['email'],
      avt: json['avt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'password': password,
      'name': name,
      'email': email,
      'avt': avt,
    };
  }
}
