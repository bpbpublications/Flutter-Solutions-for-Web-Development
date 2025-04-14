// loop_break.dart
// Using break statement in a loop in Dart
void main() {
  for (int i = 1; i <= 10; i++) {
    if (i == 6) {
      print('Breaking at $i 🚫');
      break;
    }
    print('Number: $i');
  }
}
