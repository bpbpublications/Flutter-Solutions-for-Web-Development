// custom_animation.dart
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    // Set the home to the RotatingScalingWidget
    home: RotatingScalingWidget(),
  ));
}

// Stateful widget to handle animations
class RotatingScalingWidget extends StatefulWidget {
  const RotatingScalingWidget({super.key});

  @override
  createState() => _RotatingScalingWidgetState();
}

class _RotatingScalingWidgetState extends State<RotatingScalingWidget>
    with SingleTickerProviderStateMixin {
  // AnimationController to control the animations
  late AnimationController _controller;
  // Animation for scaling the widget
  late Animation<double> _scaleAnimation;
  // Animation for rotating the widget
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController with a duration of 2 seconds
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation in reverse

    // Define the scale animation from 0.5 to 5
    _scaleAnimation = Tween<double>(begin: 0.5, end: 5).animate(
      // bounceIn curve for a bouncing effect
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );

    // Define the rotate animation from 0 to 2 * pi radians (360 degrees)
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
      // fastOutSlowIn curve for smooth rotation - try different curves
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Use AnimatedBuilder to rebuild the widget tree when the animation changes
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Apply scaling and rotation transformations
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotateAnimation.value,
                child: Container(
                  color: Colors.green, // Set the container color to green
                  width: 100, // Set the container width
                  height: 100, // Set the container height
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the tree
    _controller.dispose();
    super.dispose();
  }
}
