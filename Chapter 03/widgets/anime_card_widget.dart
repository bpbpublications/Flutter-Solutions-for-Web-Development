import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  const AnimeCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 350, fit: BoxFit.cover),
              const SizedBox(height: 16.0),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                description,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
