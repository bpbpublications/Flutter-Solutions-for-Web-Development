// user_input.dart
// Reading input from the user
import 'dart:io';

void main() {
  print('Enter your name:');
  String? name = stdin.readLineSync(); // Reading input from the user
  print('Hello, $name!');
}
