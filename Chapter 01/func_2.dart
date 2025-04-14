// func_2.dart
// Function with return type in Dart
import 'dart:math';

// function with int return type
int diceRoll() {
  return Random().nextInt(6) + 1;
}

// function with double return type
double areaOfCircle(double radius) {
  return 3.14 * radius * radius;
}

// function with String return type
String emojiMessage() {
  var num = Random().nextInt(300);
  if (num <= 100) {
    return '🎉 Party time!';
  } else if (num <= 200) {
    return '🎈 Balloon 🎈';
  } else {
    return '🎲 Roll the dice!';
  }
}
// function with List return type
List<int> generateRandomNumbers() {
  List<int> randomNumbers = [];
  for (int i = 0; i < 5; i++) {
    randomNumbers.add(Random().nextInt(100));
  }
  return randomNumbers;
}

void main() {
  // calling function inside print()
  print('🎲 Dice rolled: ${diceRoll()}');
  print('🎲 Dice rolled: ${diceRoll()}');
  print('🎲 Dice rolled: ${diceRoll()}');
  // calling function and storing result
  double radius = 10;
  double area = areaOfCircle(radius);
  print('Area of circle with radius $radius: $area');
  // calling function inside print()
  print('Area of circle with radius 5: ${areaOfCircle(5)}');

  print(emojiMessage());
  print(emojiMessage());

  List<int> result = generateRandomNumbers();
  print('Random numbers: $result');
}
