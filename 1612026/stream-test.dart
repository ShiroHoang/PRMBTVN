Stream<int> numberStream() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Stream<int> transformStream(Stream<int> input) {
  return input.map((number) => number * number)
              .where((number) => number % 2 == 0);
}

void main() async {
  final Stream<int> transformed = transformStream(numberStream());
  transformed.listen((number) => print(number));
}