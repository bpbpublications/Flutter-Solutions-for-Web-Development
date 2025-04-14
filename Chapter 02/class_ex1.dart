class Ninja {
  // Fields - properties of the class
  String name;
  String village;
  int level;

  // Constructor - helps to initialize the fields
  Ninja(this.name, this.village, this.level);

  // Method - helps to show the details of the ninja
  void showDetails() {
    print('Ninja: $name, Village: $village, Level: $level');
  }
}

void main() {
  // Creating an object of the class
  Ninja naruto = Ninja('Naruto Uzumaki', 'Leaf', 7);
  naruto.showDetails(); // Output: Ninja: Naruto Uzumaki, Village: Leaf, Level: 7
}
