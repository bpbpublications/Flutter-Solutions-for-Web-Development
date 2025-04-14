// final_func.dart
// A comprehensive example of closures in Dart
Function createGreeter(String greeting) {
  return (String name) {
    var fullGreeting = '$greeting, $name!';
    print(fullGreeting);
  };
}

void main() {
// greetHero and greetVillain are closures
  var greetHero = createGreeter('👋 Hello');
  greetHero('Dalinar');
  greetHero("Kaladin");
  greetHero("Adolin");
  var greetVillain = createGreeter('🥊Get lost');
  greetVillain('Sadeas');
  greetVillain('Moash');
}
