// modifier_base.dart

// Base class ensuring certain methods are always inherited
base class Food {
  void eat() {
    print("Eating food");
  }
}

// Subclass implementing the base class
base class Pasta extends Food {
  void prepare() {
    print("Boiling pasta and adding sauce");
  }
}

void main() {
  var pasta = Pasta();
  pasta.prepare();
  pasta.eat();
}
