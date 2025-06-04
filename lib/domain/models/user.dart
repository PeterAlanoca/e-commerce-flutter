class User {
  final String name;
  final String username;
  final String password;

  User({
    required this.name,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'username': username,
        'password': password,
      };

  factory User.fromMap(Map map) => User(
        name: map['name'],
        username: map['username'],
        password: map['password'],
      );
}