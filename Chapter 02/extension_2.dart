// extension_2.dart
extension AnimeCharacterList on List<String> {

  // Method to find anime characters based on a search query
  List<String> findAnimeCharacters(String searchQuery) {
    // this refers to the List<String> being extended
    return this
        .where((character) => 
            character.toLowerCase().contains(searchQuery.toLowerCase())) // Case-insensitive search
        .toList(); 
  }
}

void main() {
  List<String> animeCharacters = [
    "Naruto Uzumaki",
    "Sakura Haruno",
    "Luffy Monkey",
    "Ichigo Kurosaki",
    "Edward Elric"
  ];
  // Using the extension method to find anime characters
  List<String> result = animeCharacters.findAnimeCharacters("Sak");
  print(result);  // Output: [Sakura Haruno]
}
