import 'dart:io';

// Function to display the menu
void displayMenu() {
  print("Welcome to the Food Ordering System!");
  print("Here is our menu:");
  print("1. Paneer Butter Masala - ₹250");
  print("2. Chicken Biryani - ₹200");
  print("3. Veg Pulao - ₹150");
  print("4. Masala Dosa - ₹100");
  print("5. Confirm Order");
}

// Function to get the user's choice
int getUserChoice() {
  print("Enter your choice (1-5):");
  int choice = int.parse(stdin.readLineSync()!);
  return choice;
}

// Function to get the quantity of the chosen item
int getQuantity() {
  print("Enter the quantity:");
  int quantity = int.parse(stdin.readLineSync()!);
  return quantity;
}

// Function to calculate the cost of the selected item
int calculateCost(int choice, int quantity) {
  int cost = 0;
  switch (choice) {
    case 1:
      cost = 250 * quantity;
      break;
    case 2:
      cost = 200 * quantity;
      break;
    case 3:
      cost = 150 * quantity;
      break;
    case 4:
      cost = 100 * quantity;
      break;
    default:
      print("Invalid choice.");
  }
  return cost;
}

// Function to display the order summary
void displayOrderSummary(List<String> items, List<int> quantities, List<int> costs) {
  print("\nOrder Summary:");
  int totalCost = 0;
  for (int i = 0; i < items.length; i++) {
    print("${quantities[i]} x ${items[i]} = ₹${costs[i]}");
    totalCost += costs[i];
  }
  print("Total Cost: ₹$totalCost");
}

// Main function
void main() {
  List<String> orderedItems = [];
  List<int> orderedQuantities = [];
  List<int> orderedCosts = [];

  while (true) {
    displayMenu();
    int choice = getUserChoice();
    if (choice == 5) {
      break;
    }

    int quantity = getQuantity();
    int cost = calculateCost(choice, quantity);

    if (cost > 0) {
      String itemName;
      switch (choice) {
        case 1:
          itemName = "Paneer Butter Masala";
          break;
        case 2:
          itemName = "Chicken Biryani";
          break;
        case 3:
          itemName = "Veg Pulao";
          break;
        case 4:
          itemName = "Masala Dosa";
          break;
        default:
          itemName = "Unknown Item";
      }

      orderedItems.add(itemName);
      orderedQuantities.add(quantity);
      orderedCosts.add(cost);

      print("Added $quantity x $itemName to your order. Cost: ₹$cost\n");
    }
  }

  print("Order Placed Successfully!");
  displayOrderSummary(orderedItems, orderedQuantities, orderedCosts);
  print("Thank you for your order!");
}
