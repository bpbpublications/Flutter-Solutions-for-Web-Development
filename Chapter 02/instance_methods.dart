// instance_methods.dart
// A class Book with instance methods
class Book {
  String title;
  String author;

  Book(this.title, this.author);

  // Instance method to display book details
  void displayBookDetails() {
    print('Title: $title');
    print('Author: $author');
  }
}

void main() {
  Book bookA = Book('The Way of Kings', 'Brandon Sanderson');
  bookA.displayBookDetails();
}
