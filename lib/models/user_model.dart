class User {
  final int id;
  final String usernamme;
  final String email;

  User({
    required this.id,
    required this.usernamme,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      usernamme: json['username'],
      email: json['email'],
    );
  }
}
