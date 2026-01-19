class Settings {
  static final Settings _instance = Settings._internal();

  factory Settings() {
    return _instance;
  }

  Settings._internal();

  String theme = 'light';
}

void main () {
  var a = Settings();
  var b = Settings();

  print(identical(a, b));

  a.theme = 'dark';
  print(b.theme);
}