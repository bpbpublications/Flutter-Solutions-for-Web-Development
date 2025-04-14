// tear_offs.dart

// Tear off example in Dart
void shout(String message) {
  print(message.toUpperCase());
}

void main() {
  var heroes = ['Katara', 'Aang', 'Sokka', 'Toph', 'Zuko'];
  /*
  Using a tear-off, no parentheses are needed
  the forEach method expects a function that
  takes a single argument as String
  */
  heroes.forEach(shout);
}