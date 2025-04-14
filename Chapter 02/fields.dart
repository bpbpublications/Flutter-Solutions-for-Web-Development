// fields.dart
class Ninja {
  // Instance fields
  String name;
  String village;

  // Static field
  static int ninjaCount = 0;

  Ninja(this.name, this.village) {
    ninjaCount++; // Increment ninja count whenever a new ninja is created
  }
}

void main() {
  Ninja naruto = Ninja('Naruto Uzumaki', 'Leaf');
  Ninja sasuke = Ninja('Sasuke Uchiha', 'Leaf');
  Ninja kakashi = Ninja('Kakashi Hatake', 'Leaf');

  print('Ninja Count: ${Ninja.ninjaCount}'); // Output: Ninja Count: 3
}
