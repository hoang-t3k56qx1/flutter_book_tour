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
      avt: json['avt'] ??
          "https://scontent.fhan20-1.fna.fbcdn.net/v/t1.15752-9/393465944_291669270480464_6561957402276023511_n.png?_nc_cat=109&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=Oy7jtwMOPToAX8hpXRo&_nc_ht=scontent.fhan20-1.fna&oh=03_AdTBOYWBWzKeV280Belcf7fw0tPH49stdASSkgRCvNCdAg&oe=6554A889",
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
