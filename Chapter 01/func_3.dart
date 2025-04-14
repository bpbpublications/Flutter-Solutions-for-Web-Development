// func_3.dart
// Required positional parameters in Dart functions
int cubeVolume(int side) {
  return side * side * side;
}

void printHero(String name, String quirk) {
  print('$name has the quirk $quirk.');
}

void main() {
  // parameter is required
  print(cubeVolume(3));
  // both parameters are required
  printHero('Tanjiro', 'Water Breathing');
  printHero('Zenitsu', 'Thunder Breathing');
  printHero('Inosuke', 'Beast Breathing');
}
