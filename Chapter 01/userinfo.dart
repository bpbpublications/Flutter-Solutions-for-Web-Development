import 'dart:io';

void main() {
  print('Enter your name:');
  var name = stdin.readLineSync();
  print('Enter your age:');
  var age = stdin.readLineSync();
  print('Enter your height:');
  var height = stdin.readLineSync();
  // display the user's information
  print('Name: $name');
  print('Age: $age');
  print('Height: $height');
}