class User {
  //xoa final
  String name;
  static final Map<String, User> _cache = {};

  factory User(String name) {
    return _cache.putIfAbsent(name, () => User._interval(name));
  }

  User._interval(this.name);
}

void main () {
  var u1 = User("Alice");
  var u2 = User("Alice");
  u1.name = "hehe";
  print(u2.name);
  print(identical(u1, u2));
}