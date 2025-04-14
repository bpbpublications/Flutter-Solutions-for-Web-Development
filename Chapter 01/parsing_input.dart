// parsing_input.dart
// Taking numeric input from the user
import 'dart:io';

void main() {
  print('Enter your age:');
  String? input = stdin.readLineSync();
  if (input != null) {
    int age = int.parse(input); // Parsing the input to an integer
    print('You are $age years old.');
  }
}
