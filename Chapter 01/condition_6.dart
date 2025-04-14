// condition_6.dart
// Power level classifications
void main() {
  int powerLevel = 8000;

  switch (powerLevel) {
    case 9000:
      print('Over 9000! It\'s Goku\'s power level!');
      break;
    case 8000:
      print('It\'s over 8000! Strong, but not quite Goku.');
      break;
    default:
      print('Power level is unknown.');
  }
}