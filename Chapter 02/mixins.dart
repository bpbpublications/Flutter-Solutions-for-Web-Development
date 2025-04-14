// mixins.dart
// Mixins example in Dart
mixin Pewter {
  void enhanceStrength() {
    print('Strength enhanced with Pewter.');
  }
}

mixin Tin {
  void enhanceSenses() {
    print('Senses enhanced with Tin.');
  }
}

mixin Steel {
  void pushMetals() {
    print('Pushes metals with Steel.');
  }
}

mixin Iron {
  void pullMetals() {
    print('Pulls metals with Iron.');
  }
}

// Base class
class Allomancer {
  String name;

  Allomancer(this.name);

  void introduce() {
    print('I am $name, an Allomancer.');
  }
}

// `with` keyword is used to add mixins to a class
class Mistborn extends Allomancer with Pewter, Tin, Steel, Iron {
  Mistborn(String name) : super(name);

  @override
  void introduce() {
    print('I am $name, a Mistborn.');
  }
}

void main() {
  var vin = Mistborn('Vin');
  vin.introduce(); // Output: I am Vin, a Mistborn.
  vin.enhanceStrength(); // Output: Strength enhanced with Pewter.
  vin.enhanceSenses(); // Output: Senses enhanced with Tin.
  vin.pushMetals(); // Output: Pushes metals with Steel.
  vin.pullMetals(); // Output: Pulls metals with Iron.
}
