// lexical_scope.dart
// Lexical scope in Dart
void main() {
  var outerVar = 'I am an outer variable';

  void innerFunction() {
    var innerVar = 'I am an inner variable';
    print(outerVar); // Accessing outer variable
    print(innerVar); // Accessing inner variable
  }

  innerFunction();
  // print(innerVar); // Error: innerVar is not accessible here
}