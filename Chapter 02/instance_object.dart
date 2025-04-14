// instance_object.dart

class Hero {
  String name;
  String ability;

  Hero(this.name, this.ability);

  void showAbility() {
    print('$name uses $ability.');
  }
}

void main() {
  // Creating instance objects
  Hero goku = Hero('Goku', 'Kamehameha');
  Hero luffy = Hero('Luffy', 'Gum-Gum Pistol');

  goku.showAbility(); // Output: Goku uses Kamehameha.
  luffy.showAbility(); // Output: Luffy uses Gum-Gum Pistol.
}