// future_2.dart
// Example 2: Sequential execution using async/await
Future<void> performTasks() async {
  print("Task 1 started...");
  await Future.delayed(Duration(seconds: 2)); // Simulate task delay
  print("Task 1 completed.");

  print("Task 2 started...");
  await Future.delayed(Duration(seconds: 1)); // Simulate task delay
  print("Task 2 completed.");
}

void main() {
  performTasks(); // Initiating sequential asynchronous tasks
  print("Main function continues...");
}

// Output:
// Task 1 started...
// Main function continues...
// Task 1 completed.
// Task 2 started...
// Task 2 completed.