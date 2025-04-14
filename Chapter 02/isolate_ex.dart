import 'dart:isolate';

void processComment(String comment) {
  // Simulate a long processing task
  print('Processing comment: $comment');
}

void main() {
  List<String> comments = [
    'I love this post!',
    'Great discussion here!',
    'Cant wait for the next update!',
    'Thanks for sharing this info.'
    'I m learning a lot from this post.',
    'This is a great resource.',
    'I m glad I found this post.',
  ];

  // Start a new isolate for each comment to simulate concurrent processing
  for (var comment in comments) {
    Isolate.spawn(processComment, comment);
  }
}
