// condition_4.dart
// Checking coordinates
void main() {
  var pair1 = [4, 5];
  var pair2 = [4, 5, 6];
  if (pair1 case [int x, int y]) {
    print('Pair1 is a 2D coordinate.');
  } else {
    print('Pair1 is not a 2D coordinate.');
  }
  if (pair2 case [int x, int y]) {
    print('Pair2 is a 2D coordinate.');
  } else {
    print('Pair2 is not a 2D coordinate.');
  }
}
