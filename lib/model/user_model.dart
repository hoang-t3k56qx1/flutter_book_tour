class User {
  final int uid;
  final String username;
  final String password;
  final String name;
  final String email;
  final String avt;

  User({
    this.uid = 0,
    this.username = "",
    this.password = "",
    this.name = "",
    this.email = "",
    this.avt = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? 0,
      username: json['username'] ?? "",
      password: json['password'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      avt: json['avt'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid ?? 0,
      'username': username ?? "",
      'password': password ?? "",
      'name': name ?? "",
      'email': email ?? "",
      'avt': avt ?? "",
    };
  }
}
