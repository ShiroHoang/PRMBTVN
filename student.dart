class Student {
  final String id;
  String _name;
  double gpa;

  Student(this.id, this._name, [this.gpa = 0]);

  void display() {
    print("ID: $id, Name: $_name, GPA: $gpa");
  }

  // Getter
  String get name => _name;

  // Setter
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    }
  }
}

void main() async {
  Student st1 = Student("112", "Con Vit", 12.1);
  st1.display();

  // DucAnh()..sound()..sound();
  // DucAnh().sound();

  List<Student> students = [Student("SV1", "Con Cá", 3.5), Student("SV2", "Con Gà", 2.8), Student("SV3", "Con Ngan", 3.9)];

  var names = students
              .where((s) => s.gpa >= 3.0)
              .map((s) => s._name)
              .toList();
  print(names);

  print("Loading");
  await Future.delayed(Duration(seconds: 5));
  students.forEach((s) => print(s._name));

  // Future.delayed(Duration(seconds: 5)).then((_) {
  //   print("Done");
  // });

}

class Animal {
  void sound() => print("Some");
}

class DucAnh extends Animal {
  @override void sound() => print("Woof woof!");
}