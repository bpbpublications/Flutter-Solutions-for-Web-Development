// modifier_sealed.dart

sealed class SeaFood {
  void prepare();
}

class Fish extends SeaFood {
  @override
  void prepare() {
    print("Cleaning fish 🐟");
    print("Cooking fish 🐟");
    print("Serving fish 🍤");
  }
}

void main() {
  // error can't instantiate directly
  // var seafood = SeaFood();
  var fish = Fish();
  fish.prepare();
}
