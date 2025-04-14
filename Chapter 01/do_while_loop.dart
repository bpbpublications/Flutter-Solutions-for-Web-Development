// do_while_loop.dart
// Using do-while loop in Dart
void main() {

  var count = 1;
  do {
    print('🍦 Ice cream cone $count');
    count++;
  } while (count <= 5);

  // loop when apples are greater than 5
  var apples = 1;
  do {
    print('You have 🍎 Apple $apples');
    apples--;
  } while (apples > 5);
}
