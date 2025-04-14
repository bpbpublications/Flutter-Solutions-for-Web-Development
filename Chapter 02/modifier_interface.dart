// modifier_interface.dart
interface class Food {
  void prepare() {}
}

class Burger implements Food {
  @override
  void prepare() {
    print("Grilling patty and adding toppings");
  }
}
