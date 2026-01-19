class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  // Deserialize from JSON (Map)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'User{name: $name, email: $email}';
  }
}

Future<List<Map<String, dynamic>>> fetchUsersJson() async {
  // giả lập delay gọi API
  await Future.delayed(Duration(seconds: 1));

  return [
    {
      "name": "Alice",
      "email": "alice@gmail.com",
    },
    {
      "name": "Bob",
      "email": "bob@gmail.com",
    },
    {
      "name": "Charlie",
      "email": "charlie@gmail.com",
    },
  ];
}

Future<List<User>> getUsers() async {
  final jsonList = await fetchUsersJson();

  return jsonList
      .map((json) => User.fromJson(json))
      .toList();
}

void main() async {
  List<User> users = await getUsers();

  for (var user in users) {
    print(user);
  }
}
