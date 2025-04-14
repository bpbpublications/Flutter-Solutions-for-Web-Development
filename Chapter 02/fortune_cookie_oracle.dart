// fortune_cookie_oracle.dart
import 'dart:async';
import 'dart:math';

class FortuneCookie {
  // List of fortunes with emojis
  static const List<String> _fortunes = [
    "🔮 Your future is bright!",
    "🍀 Good things are coming your way.",
    "🌟 Success is in your future.",
    "💖 Love and happiness await you.",
    "⏳ Patience is a virtue; good things take time.",
    "🌈 A rainbow of opportunities is coming your way.",
  ];

  // Method to fetch a random fortune
  Future<String> getFortune() async {
    // Simulate delay
    await Future.delayed(Duration(seconds: 2));
    // Randomly select a fortune
    int index = Random().nextInt(10);
    return _fortunes[index];
  }
}

void main() async {
  var oracle = FortuneCookie();
  print("🔮️🔮🔮🧙‍♂️🥠🥠🥠");
  print("Welcome to the Fortune Cookie Oracle!");
  try {
    print("Cracking open your virtual fortune cookie...");
    String fortune = await oracle.getFortune();
    print("🥠 Your fortune: $fortune");
  } catch (e) {
    print("Your fortune could not be revealed. Try again later.");
  }
}

