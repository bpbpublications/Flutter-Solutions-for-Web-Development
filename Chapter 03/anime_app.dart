import 'package:flutter/material.dart';

import 'widgets/anime_card_widget.dart';

void main() {
  runApp(const MyAnimeApp());
}

class MyAnimeApp extends StatelessWidget {
  const MyAnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Anime Characters')),
      body: SizedBox(
        width: 400,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            AnimeCard(
              name: 'Naruto Uzumaki',
              imagePath: 'assets/images/naruto.jpg',
              description:
                  'A ninja from the Hidden Leaf Village with a dream of becoming Hokage.',
            ),
            AnimeCard(
              name: 'Goku',
              imagePath: 'assets/images/goku.jpg',
              description:
                  'A Saiyan from Earth who strives to be the strongest fighter in the universe.',
            ),
            AnimeCard(
              name: 'Monkey D. Luffy',
              imagePath: 'assets/images/luffy.jpg',
              description:
                  'A pirate with the goal of finding the One Piece and becoming the Pirate King.',
            ),
          ],
        ),
      ),
    );
  }
}
