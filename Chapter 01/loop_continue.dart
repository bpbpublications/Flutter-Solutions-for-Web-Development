// loop_continue.dart
// Using continue statement in a loop in Dart
void main() {
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue; // Skip even numbers
    }
    print('🎈 Balloon $i');
  }
}
