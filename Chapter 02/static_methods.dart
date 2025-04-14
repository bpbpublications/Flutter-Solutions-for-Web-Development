// static_methods.dart
// A class Alchemist with a static method
class Alchemist {
  String name;
  String specialty;

  Alchemist(this.name, this.specialty);

  // Instance method
  void transmute() {
    print('$name performs $specialty transmutation.');
  }

  // Static method
  static void study() {
    print('Studying alchemy principles...');
  }
}

void main() {
  Alchemist.study(); // called without creating an instance
  Alchemist edward = Alchemist('Edward Elric', 'Metal');
  edward.transmute();
}
