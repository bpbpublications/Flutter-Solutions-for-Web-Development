import 'package:test/test.dart';

int add(int a, int b) => a + b;
int divide(int a, int b) => a ~/ b;

void main() {
  test('add 2 numbers', () {
    expect(add(1, 2), 3);
  });

  test('divide 2 numbers', () {
    expect(divide(6, 3), 2);
  });

  test('divide by zero', () {
    expect(() => divide(6, 0), throwsA(isA<Exception>()));
  });
}
