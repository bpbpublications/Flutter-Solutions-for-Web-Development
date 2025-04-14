// synchronous.dart
// Example: Synchronous execution in Dart
void main() {
  print('Task 1 started...');
  performTask1(); // Synchronous task
  print('Task 1 completed.');

  print('Task 2 started...');
  performTask2(); // Synchronous task
  print('Task 2 completed.');
}

void performTask1() {
  // Simulate time-consuming task
  for (int i = 0; i < 10000000000; i++) {}
}

void performTask2() {
  // Simulate another task
  print('Performing task 2...');
}