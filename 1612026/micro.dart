import 'dart:async';

void main() {
  print('Start');

  scheduleMicrotask(() {
    print("Hehe micro task 1");
  });

  Future(() {
    print("Hehe future 1");
  });

 scheduleMicrotask(() {
    print("Hehe micro task 2");
  });

  Future(() {
    print("Hehe future 2");
  });
 
  print("Hehe end");
}