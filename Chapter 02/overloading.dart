// overloading.dart
// positional parameters and named parameters for overloading
class PositionalEx {
  String name;
  int age;

  PositionalEx(this.name, [this.age = 10]);

  void showDetails() {
    print('Name: $name, Age: $age');
  }
}

class NamedParamEx {
  String name;
  int age;

  // required keyword is used to make the parameter mandatory
  NamedParamEx({required this.name, this.age = 10});

  void showDetails() {
    print('Name: $name, Age: $age');
  }
}

void main() {
  PositionalEx example1 = PositionalEx('Kakashi', 30);
  PositionalEx example2 = PositionalEx('Naruto');
  example1.showDetails();
  example2.showDetails();

  NamedParamEx example3 = NamedParamEx(name: 'Sasuke', age: 12);
  NamedParamEx example4 = NamedParamEx(name: 'Sakura');

  example3.showDetails();
  example4.showDetails();
}
