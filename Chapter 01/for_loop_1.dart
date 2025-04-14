// for_loop_1.dart
// Using for loop in Dart
void main() {
  // example 1
  for (int i = 1; i <= 5; i++) {
    print('🍕 Pizza slice $i');
  }
  // example 2 - even numbers
  print('Even numbers between 1 and 10:');
  for (int i = 2; i <= 10; i += 2) {
    print("🚩 $i");
  }
  // sum of all odd numbers between 1 and 10
  int sum = 0;
  for (int i = 1; i <= 10; i += 2) {
    sum += i;
  }
  print('Sum of all odd numbers between 1 and 10: $sum');
}
