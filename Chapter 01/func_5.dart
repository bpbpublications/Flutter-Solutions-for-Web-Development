// func_5.dart
// Named parameters in Dart functions
void printCharacter({required String name, String? heroName}) {
  // Datatype? makes the parameter optional
  if (heroName != null) {
    print('$name also known as $heroName.');
  } else {
    print('$name is not a hero.');
  }
}

void main() {
  printCharacter(name: 'Tony Stark', heroName: 'Ironman');
  // order can be changed
  printCharacter(heroName: 'Captain America', name: 'Steve Rogers');
  printCharacter(name: 'Odin');
  printCharacter(name: 'Loki', heroName: 'God of Mischief');
  printCharacter(name: 'Nick Fury');
}



