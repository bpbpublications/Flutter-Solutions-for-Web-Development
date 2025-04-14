// lexical_closure.dart
// Closure in Dart
Function createAdder(int addend) {
  return (int value) => value + addend;
}

void main() {
  var add5 = createAdder(5);
  var add10 = createAdder(10);

  print(add5(2)); // 7
  print(add10(2)); // 12
}