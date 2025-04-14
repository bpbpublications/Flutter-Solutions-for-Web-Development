// func_1.dart
// Simple function usage in Dart
void shout(String message) {
  print("😃${message.toUpperCase()}!");
}

void whisper(String message) {
  print("🥱${message.toLowerCase()}...");
}

void main() {
  // calling the functions directly
  shout("Plus Ultra!");
  whisper("Plus Ultra!");
  /*
  Demo of first-class functions concept in Dart
  By storing the functions in a variable
  Here talk is a variable that stores the shout function
  */
  Function talk = shout;
  talk('I am here!');
  // updating the talk variable to store the whisper function
  talk = whisper;
  talk('I am here!');
}
