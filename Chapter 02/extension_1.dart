// extension_1.dart 
extension AnimeString on String {
  bool containsAnime() {
    return this.contains('anime');
  }
}

void main() {
  String description1 = "I love watching One piece anime";
  String description2 = "I love watching ben10 cartoon";
  
  if (description1.containsAnime()) {
    print("This string talks about anime!");
  } else {
    print("No anime here.");
  }

  if (description2.containsAnime()) {
    print("This string talks about anime!");
  } else {
    print("No anime here.");
  }
}
