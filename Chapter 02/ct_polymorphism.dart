// ct_polymorphism.dart
// Compile-time polymorphism example in Dart
class Spell {
  String name;

  // Default constructor
  Spell(this.name);

  // 2 Named constructor
  Spell.fireball() : name = '🔥Fireball🔥';

  Spell.iceBlast() : name = '❄️Ice Blast❄️';

  void cast() {
    print('Casting $name.');
  }
}

void main() {
  Spell fireSpell = Spell.fireball();
  Spell iceSpell = Spell.iceBlast();

  fireSpell.cast();
  iceSpell.cast();
}