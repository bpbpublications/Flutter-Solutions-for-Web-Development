// func_6.dart
// Shorthand syntax for defining functions in Dart

void main() {
  /*
  Defining a function using the shorthand syntax
  use the fat arrow (=>) to define the function body
  no need to use the curly braces and return keyword
  */
  void shout(String message) => print("${message.toUpperCase()}!");
  void whisper(String message) => print("${message.toLowerCase()}");
  int power(int base, [int exponent = 2]) => base * exponent;

  // calling the functions directly
  shout("Plus Ultra!");
  whisper("Plus Ultra!");
  print('2^3: ${power(2, 3)}');
  print('2^4: ${power(2, 4)}');
}
