void main () {
  var list = [for (var i = 0; i < 10; i++) if (i % 2 == 0) i];
  print(list);
  print([...list, 22]);

}