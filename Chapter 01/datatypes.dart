void main(){
  int age = 25;
  int year = 2024;
  double height = 1.75;
  double pi = 3.14159;
  String name = 'Zaid Kamil';
  String message = "Dart is Love";
  bool isAuthor = true;
  bool isEmployee = true;
  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> names = ['Dalinar', 'Kaladin', 'Shallan', 'Jasnah'];
  Map<String, int> ratings = {'Dart': 5, 'Flutter': 5, 'Java': 3, 'Kotlin': 4};
  Map<int, String> products = {1: 'Laptop', 2: 'Smartphone', 3: 'Tablet'};
  Set<int> uniqueNumbers = {1, 2, 3, 4, 5};
  Set<String> uniqueOrders = {'Windrunner', 'Skybreaker', 'Edgedancer', 'Truthwatcher'};
  Runes input = Runes('\u2665 \u{1f600}'); // Unicode characters
  String emojis = String.fromCharCodes(input); // "♥ 😀"
  Symbol libraryName = #exampleLibrary;
  print("Data Types in Dart");
  print("number: age = $age & year = $year");
  print("double: height = $height & pi = $pi");
  print("String: name = $name & message = $message");
  print("bool: isAuthor = $isAuthor & isEmployee = $isEmployee");
  print("List<int>: numbers = $numbers");
  print("List<String>: names = $names");
  print("Map<String, int>: ratings = $ratings");
  print("Map<int, String>: products = $products");
  print("Set<int>: uniqueNumbers = $uniqueNumbers");
  print("Set<String>: uniqueOrders = $uniqueOrders");
  print("Runes: input = $input & emojis = $emojis");
  print("Symbol: libraryName = $libraryName");
}