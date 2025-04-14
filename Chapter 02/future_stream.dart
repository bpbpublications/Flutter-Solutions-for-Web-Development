// future_stream.dart
// Example: Creating a stream controller in Dart
import 'dart:async';

void main() {
  // Creating a stream controller with integer data type
  var controller = StreamController<int>();

  // Adding data to the stream
  for (int i = 1; i <= 5; i++) {
    controller.sink.add(i);
  }

  // Closing the stream (important to prevent memory leaks)
  controller.close();

  // Listening to the stream
  controller.stream.listen(
    (data) => print('Received: $data'),
    onDone: () => print('Stream closed'),
    onError: (error) => print('Error: $error'),
  );
}
