import 'package:flutter/material.dart';

void main() {
  runApp(BookCounter());
}

class BookCounterProvider extends InheritedWidget {
  final int booksRead;
  final Function() incrementBooksRead;

  BookCounterProvider({
    Key? key,
    required this.booksRead,
    required this.incrementBooksRead,
    required Widget child,
  }) : super(key: key, child: child);

  static BookCounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BookCounterProvider>();
  }

  @override
  bool updateShouldNotify(BookCounterProvider oldWidget) {
    return oldWidget.booksRead != booksRead;
  }
}

class BookCounter extends StatefulWidget {
  @override
  _BookCounterState createState() => _BookCounterState();
}

class _BookCounterState extends State<BookCounter> {
  int _booksRead = 0;

  void _incrementCounter() {
    setState(() {
      _booksRead++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BookCounterProvider(
      booksRead: _booksRead,
      incrementBooksRead: _incrementCounter,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Stormlight Archive Tracker"),
            centerTitle: true,
            leading: Icon(Icons.menu),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BookDisplay(),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text("Read Another Book"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = BookCounterProvider.of(context);
    return Column(
      children: [
        Text(
          'Books read:',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          '${provider?.booksRead ?? 0}',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.red[300],
          ),
        ),
      ],
    );
  }
}
