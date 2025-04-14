// interface.dart
// A simple example of an interface in Dart

// Interface
abstract class CanMakeSound {
  void makeSound();
}

// Class implementing the interface
class Dog implements CanMakeSound {
  @override
  void makeSound() {
    print('Dog barks.');
  }
}

// Class implementing another interface
class Bird implements CanMakeSound {
  @override
  void makeSound() {
    print('Bird chirps.');
  }
}

void main() {
  Dog dog = Dog();
  Bird bird = Bird();

  dog.makeSound(); // Output: Dog barks.
  bird.makeSound(); // Output: Bird chirps.
}
