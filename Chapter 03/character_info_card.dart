import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: CharacterInfoCard(
        characterName: 'Son Goku',
        description: 'Z fighter',
        imagePath: 'assets/images/goku.jpg',
      ),
    ),
  ));
}

class CharacterInfoCard extends StatelessWidget {
  final String characterName;
  final String description;
  final String imagePath;

  CharacterInfoCard({
    super.key,
    required this.characterName,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return _buildMobileLayout();
        } else {
          return _buildDesktopLayout();
        }
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Image.asset(imagePath),
        Text(characterName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(description),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    double height = 400;
    return Container(
      color: Colors.blue[200],
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Image.asset(
                imagePath,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    characterName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
