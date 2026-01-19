import 'dart:io';
import 'student.dart';

void main1() {
  int a = 1;
  double b = 2.5;
  String str = 'con vit';
  bool check = a == b;

  print("helo $str, is a and b equal? Answer is $check. a + b = ${a + b}");
}

void main2() {
  List<int> listInt = [5, 10, 15, 10, 20];
  print("Tổng phần tử đầu và cuối là ${listInt[0] + listInt[listInt.length - 1]}");
  print("Phần tử thứ 2 có lớn hơn 8 không? ${listInt[1] > 8}");

  Set<int> setInt = listInt.toSet();
  print("new Set is $setInt");

  Map<String, int> mapInt = {"first": listInt[0], "last": listInt[listInt.length - 1]};
  print("first in list is ${mapInt['first']}, last in list is ${mapInt['last']}");

  print("Third value of list is ${listInt[2]}");
  listInt.add(25);
  print("new list is $listInt");
  listInt.remove(10);
  print("new list is $listInt");

  print("first in Map is ${mapInt['first']}");
}

void sayHello(String name,int age, double mark, void Function(int age, double mark) hehe) {
  print("Xin chào $name");
  hehe(age, mark);
}

void mainTest() {
  sayHello("Con vịt", 12, 6.7, (age, mark) => print("Age: $age, mark: $mark"));
}


int calculateSum(int a, int b) {
  return a + b;
}

void main11() {
  int result = calculateSum(12, 2);
  print('Tổng = $result');
}

void printInfo(String name, [int? age]) {

  if (age == null) {
    print("Name: $name, Age not provided");
  } else {
    print("Name: $name, Age: $age");
  }

}

void main12() {
  printInfo("Hoang");
  printInfo("Hofang", 12);
}

void createUser({required String username, required String email, String? phone}) {
  print("Username: $username");
  print("Email: $email");
  if (phone == null) {
    print("Phone is not provided");
  } else {
    print("Phone: $phone");
  }
}

void main13() {
  createUser(username: "Con Vit", email: "quaivatvit@gg.com");
  createUser(username: "Con Ga", email: "quaivatga@gg.com", phone: "112");
}

double calculatePrice(double price , {int tax = 10}) {

  return price + price * tax / 100;
}

void main14() {
  print("Price after tax: ${calculatePrice(100)}");
  print("Price after tax: ${calculatePrice(100, tax: 14)}");
}

void processNumber(int n, int Function(int) operation) {
 int result = operation(n);
 print('Kết quả: $result');
}

void main5() {
 processNumber(5, (x) => x * 2); 
 processNumber(5, (x) => x * x); 
}

void rankStudent(int mark) {
  
  stdout.write("Điểm xếp hạng hạnh kiểm: ");
  if (mark > 100) {
    print("Điểm không hợp lệ");
  } else if (mark > 89) {
    print("Xuất xắc");
  } else if (mark > 79) {
    print("Giỏi");
  } else if (mark > 69) {
    print("Khá");
  } else if (mark > 49) {
    print("Trung bình");
  } else if (mark > -1){
    print("Yếu");
  } else {
    print("Điểm không hợp lệ");
  }

}

void main6() {
  rankStudent(101);
  rankStudent(95);
  rankStudent(85);
  rankStudent(75);
  rankStudent(65);
  rankStudent(45);
  rankStudent(-1);
}

void main(List<String> args) {
  // final stream = Stream.periodic(const Duration(milliseconds: 2000), (i) => i).take(5);

  // stream.listen(
  //   (value) => print("Value: $value"),
  //   onDone: () => print("Done"),
  // );

  List<Student> list = [Student("Con ga", "haha", 12.2)];
  print(list[0].name);
  // final evens = stream.where((n) => n.isEven).map((n) => n * 10);
  // evens.listen((v) => print("$v"));
}