// explicit_animation.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // set home to the MovingBox widget
    home: MovingBox(),
  ));
}

class MovingBox extends StatefulWidget {
  @override
  _MovingBoxState createState() => _MovingBoxState();
}

// SingleTickerProviderStateMixin allows the animation controller to work
class _MovingBoxState extends State<MovingBox>
    with SingleTickerProviderStateMixin {
  // _controller controls the animation
  late AnimationController _controller;
  // _animation will animate the position of the box using an Offset
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    // creates an AnimationController that repeats the animation
    _controller = AnimationController(
      // set the duration to 2 seconds
      duration: const Duration(seconds: 2),
      // vsync is set to this to use the SingleTickerProviderStateMixin
      vsync: this,
    )..repeat(reverse: true);

    // _animation animates the position of the box
    _animation = Tween<Offset>(
      // set the start position to (0.0, 0.0)
      begin: Offset.zero,
      // set the end position to (5.0, 5.0)
      end: const Offset(5.0, 5.0),
    ).animate(
      // use a CurvedAnimation to apply a curve to the animation
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set the body to a SlideTransition widget
      body: SlideTransition(
        // sets position of the box using the _animation
        position: _animation,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // dispose the controller when the widget is removed from the tree
    _controller.dispose();
    super.dispose();
  }
}
