// components/my_custom_container.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const Myp());
}

class Myp extends StatelessWidget {
  const Myp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyCustomContainer(
          title: 'Hello World Hello World Hello World Hello World',
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1711279433915-d1d87c42c795?q=80&w=2371&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ),
    );
  }
}

class MyCustomContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double height;
  final double width;

  // constructor
  const MyCustomContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    this.height = 500,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // decoration to add image and text
      decoration: BoxDecoration(
        // image decoration adds image to the container
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          // color filter to darken the image
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.5),
            BlendMode.darken,
          ),
        ),
      ),
      // alignment to center the text
      child: Align(
        child: Text(
          title,
          // text styling
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
