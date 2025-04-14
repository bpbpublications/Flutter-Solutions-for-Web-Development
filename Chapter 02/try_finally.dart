// try_finally.dart
// Exception handling using try-finally block
import 'dart:io';
void addNumbers(int a, int b) {
  print("Sum: ${a + b}");
}

void main() {
  try {
    print("Enter first number: ");
    var num1 = int.parse(stdin.readLineSync() ?? '');
    print("Enter second number: ");
    var num2 = int.parse(stdin.readLineSync() ?? '');
    addNumbers(num1, num2);
  } on FormatException {
    print("Invalid number");
  }
  finally {
    print("Program completed!");
  }
}