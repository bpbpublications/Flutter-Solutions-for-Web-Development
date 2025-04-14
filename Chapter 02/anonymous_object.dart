// anonymous_object.dart
class Spell {
  String name;
  int power;

  Spell(this.name, this.power);

  void cast() {
    print('Casting $name with power $power.');
  }
}

void main() {
  // Using an anonymous object
  Spell('Fireball', 50).cast(); // Output: Casting Fireball with power 50.
}