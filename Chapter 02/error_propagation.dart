// error_propagation.dart

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
    // Propagate the error further if needed
    rethrow; // Re-throws the current exception
  }
}

void main() {
  try {
    fetchData();
  } catch (e) {
    print('Error in main function');
    // Propagate the error further if needed
  }
}
