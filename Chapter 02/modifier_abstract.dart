// modifier_abstract.dart
abstract class Food {
  void prepare(); // Abstract method
}

class Pizza extends Food {
  @override
  void prepare() {
    print("Preparing pizza dough and adding toppings");
  }
}

class Salad implements Food {
  @override
  void prepare() {
    print("Chopping vegetables and adding dressing");
  }
}

void main() {
  var pizza = Pizza();
  pizza.prepare();

  var salad = Salad();
  salad.prepare();
}