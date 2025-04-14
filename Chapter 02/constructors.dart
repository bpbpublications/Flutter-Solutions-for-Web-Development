// constructors.dart
// default, parameterized, and named constructors
class DefaultExample {
  DefaultExample() {
    print('Default constructor called');
  }
}

class ParameterizedExample {
  String name;
  int age;

  ParameterizedExample(this.name, this.age);

  void showDetails() {
    print('Name: $name, Age: $age');
  }
}

class NamedExample {
  String name;
  int age = 0; // Default value

  NamedExample(this.name, this.age);

  // Named constructor
  NamedExample.withoutAge(this.name);

  void showDetails() {
    print('Name: $name, Age: $age');
  }
}

void main() {
  // Creating objects of the classes
  DefaultExample example1 = DefaultExample();

  ParameterizedExample example2 = ParameterizedExample('Alice', 25);
  example2.showDetails();

  NamedExample example3 = NamedExample('Bob', 30);
  NamedExample example4 = NamedExample.withoutAge('Charlie');

  example3.showDetails();
  example4.showDetails();
}
