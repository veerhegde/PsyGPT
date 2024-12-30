class User {
  final int id;
  final String name;
  final String email;
  final String token;

  User({required this.id, required this.name, required this.email, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }
}