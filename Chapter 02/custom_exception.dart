// custom_exception.dart
// Custom exception example in Dart
class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

void fetchData() {
  try {
    // Simulating network operation
    throw NetworkException('Failed to fetch data from server.');
  } catch (e) {
    print('Error occurred: $e');
  }
}

void main() {
  fetchData();
}
