// future_1.dart
// Example 1: Simulating a delayed operation using Future
Future<void> fetchUserData() async {
  print("Fetching user data...");
  await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  print("User data fetched successfully!");
}

void main() {
  fetchUserData(); // Initiating asynchronous operation
  print("Program continues to execute other tasks...");
}
