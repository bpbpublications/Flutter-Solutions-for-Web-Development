// rt_polymorphism.dart
// Run-time polymorphism example in Dart

class MagicalCreature {
  String name;

  MagicalCreature(this.name);

  void speak() {
    print('$name makes a magical sound.');
  }
}

// Subclass 1
class Phoenix extends MagicalCreature {
  Phoenix(String name) : super(name);

  void speak() {
    print('$name sings a beautiful, haunting melody.');
  }
}

// Subclass 2
class HouseElf extends MagicalCreature {
  HouseElf(String name) : super(name);

  void speak() {
    print('$name says, "Master has given $name a sock!"');
  }
}

// Subclass 3
class Centaur extends MagicalCreature {
  Centaur(String name) : super(name);

  void speak() {
    print('$name says, "Mars is bright tonight."');
  }
}

void main() {
  // List of MagicalCreature objects
  List<MagicalCreature> creatures = [
    Phoenix('Fawkes'),
    HouseElf('Dobby'),
    Centaur('Firenze')
  ];

  for (var creature in creatures) {
    creature.speak();
  }
}
