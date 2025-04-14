// while_loop.dart
// Using while loop in Dart
void main() {
  var count = 1;
  while (count <= 5) {
    print('🍩 Donut $count');
    count++;
  }

  // sum of all digits
  var num = 12345;
  var sum = 0;
  while (num > 0) {
    sum += num % 10;
    num ~/= 10;
  }
  print('Sum of all digits: $sum');
}
