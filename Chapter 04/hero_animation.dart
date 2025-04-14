import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                );
              },
              child: Hero(
                tag: 'hero-image',
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.network(
                    'https://picsum.photos/100?image=13',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.grey,
            child: Hero(
              tag: 'hero-image',
              child: Image.network(
                'https://picsum.photos/500?image=13',
                width: double.infinity,
                repeat: ImageRepeat.repeatX,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This is a detail screen',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
