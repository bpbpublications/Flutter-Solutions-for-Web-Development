// try_on.dart
// Exception handling using try-on block
import 'dart:io';

void main() {
  try {
    print("Enter a number: ");
    // throws FormatException if input is not a number
    var num = int.parse(stdin.readLineSync() ?? '');
    print("You entered: $num");
  } on FormatException {
    print("Invalid number");
  }
}
