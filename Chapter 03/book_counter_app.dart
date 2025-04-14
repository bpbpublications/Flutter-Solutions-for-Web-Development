import 'package:flutter/material.dart';

void main() {
  runApp(BookCounter());
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stormlight Archive Tracker"),
          centerTitle: true,
          leading: const Icon(Icons.menu),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Books read:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '$_booksRead',
                style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[300]),
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text("Read Another Book"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
