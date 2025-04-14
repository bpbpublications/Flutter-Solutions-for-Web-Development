// Inheritance.dart
// Program to demonstrate inheritance in Dart
class Creature {
  String name;
  int health;

  Creature(this.name, this.health);

  void attack() {
    print('🤜 $name attacks!');
  }
}

class Elf extends Creature {
  String weapon;

  Elf(String name, int health, this.weapon) : super(name, health);

  void useMagic() {
    print('$name uses magic with $weapon.');
  }
}

class Orc extends Creature {
  String strength;

  Orc(String name, int health, this.strength) : super(name, health);

  void smash() {
    print('$name smashes with strength of $strength.');
  }
}
class Dragon extends Creature {
  String fire;

  Dragon(String name, int health, this.fire) : super(name, health);

  void breatheFire() {
    print('$name breathes fire with $fire.');
  }
}

void main() {
  Elf legolas = Elf('Legolas', 100, '🏹 Bow and Arrow ');
  Orc azog = Orc('Azog', 120, '💪 Brute Force');
  // var is used to declare a variable without specifying its type
  var smaug = Dragon('Smaug', 500, '🔥 Fire');
  legolas.attack();
  legolas.useMagic();

  azog.attack();
  azog.smash();

  smaug.attack();
  smaug.breatheFire();
}
