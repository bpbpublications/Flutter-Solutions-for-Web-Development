// factory_constructor.dart
// a class Circle with factory constructor
class Circle {
  double radius;

  // Private constructor
  Circle(this.radius);

  // Factory constructor to return an instance of Circle
  factory Circle.fromDiameter(double diameter) {
    return Circle(diameter / 2);
  }

  // Getter to calculate the area of the circle
  double get area => 3.14 * radius * radius;
}

void main() {
  Circle circle1 = Circle(5);
  // Using factory constructor to create a circle from diameter
  Circle circle2 = Circle.fromDiameter(10);

  print('Area of circle1: ${circle1.area}'); // Output: Area of circle1: 78.5
  print('Area of circle2: ${circle2.area}'); // Output: Area of circle2: 78.5
}