// setters.dart
// A class Circle with a setter for the radius property
class Circle {
  double _radius;

  Circle(this._radius);

  // Getter for _radius
  double get radius => _radius;

  // validates and sets the new radius
  set radius(double newRadius) {
    if (newRadius > 0) {
      _radius = newRadius;
    } else {
      print('Radius must be positive.');
    }
  }
}

void main() {
  Circle circle = Circle(5.0);
  circle.radius = 10.0; // Set the new radius
  print(circle.radius);
  circle.radius = -5.0; // Attempt to set an invalid radius
}
