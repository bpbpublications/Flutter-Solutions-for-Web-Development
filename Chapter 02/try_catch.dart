// try_catch.dart
void main() {
  try {
    // Risky operation that may throw an exception
    int result = 10 ~/ 0;
    // Above line will throw an IntegerDivisionByZeroException
  } catch (e) {
    // Handling the exception
    print('Exception caught: $e');
  }
}
