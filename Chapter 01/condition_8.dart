// condition_8.dart
// Checking Access to the Restricted Section
void main() {
  String character = 'Hermione';
  bool hasPermission = false;

  if (!hasPermission) {
    print('$character is not allowed to enter the restricted section.');
    return;
  }
  print('$character is allowed to enter the restricted section.');
}
