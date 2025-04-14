// func_4.dart
// Function with optional positional parameters in Dart
int power(int base, [int exponent = 2]) {
  int result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

void main() {
  print('2^2: ${power(2)}');
  print('2^3: ${power(2, 3)}');
  print('2^4: ${power(2, 4)}');
  var ans = power(10, 4);
  print('ans is $ans');
}
