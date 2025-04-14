// func_7.dart
// Anonymous functions in Dart

void main() {
  // Anonymous function with no parameters
  var add = (int a, int b) {
    return a + b;
  };
  print(add(2, 3));

  // Anonymous function with parameters
  var multiply = (int a, int b) => a * b;
  print(multiply(2, 3));

  // Anonymous function with no return type
  var greet = () {
    print('Hello, World!');
  };
  greet();
}

