// getters.dart
class Circle {
  // Private property cant be accessed directly
  double _radius;

  Circle(this._radius);

  // Getter for _radius
  double get radius => _radius;
}

void main() {
  Circle circle = Circle(5.0);
  print(circle.radius); // Output: 5.0
}
