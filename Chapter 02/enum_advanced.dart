// enum_advanced.dart
// Advanced enum example
enum Meal implements Comparable<Meal> {
  // Enum values
  simple(burger: 199, fries: 50, drink: 100),
  premium(burger: 299, fries: 100, drink: 150),
  deluxe(burger: 399, fries: 150, drink: 200);

  // final fields
  final int burger;
  final int fries;
  final int drink;

  // Constructor
  const Meal({required this.burger, required this.fries, required this.drink});

  // Total cost of the order
  int get total => burger + fries + drink;

  // Compare orders based on total cost
  @override
  int compareTo(Meal other) => total.compareTo(other.total);
}

void main() {
  final orders = [Meal.simple, Meal.premium, Meal.deluxe];
  orders.sort();
  for (final order in orders) {
    print('$order, Total: \$${order.total}');
  }
}
