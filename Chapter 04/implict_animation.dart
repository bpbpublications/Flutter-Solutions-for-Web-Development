// implicit_animation.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // set home to AnimatedImage
    home: AnimatedImage(),
  ));
}

// AnimatedImage is a StatefulWidget
class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

// _AnimatedImageState is a State of AnimatedImage
class _AnimatedImageState extends State<AnimatedImage> {
  // _isPressed is a boolean variable
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(_isPressed ? 'Shrink the Dragon!' : 'Grow the Dragon!'),
      // add GestureDetector to the AnimatedContainer
      GestureDetector(
          onTap: () {
            // set _isPressed to the opposite of its current value
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          child: AnimatedContainer(
              // set duration to 1 second
              duration: const Duration(seconds: 1),
              // set width to 1000.0 if _isPressed is true, otherwise set it to 100.0
              width: _isPressed ? 1000.0 : 100.0,
              child: ColorFiltered(
                // apply a color filter to the image
                colorFilter: const ColorFilter.mode(
                  Colors.blue,
                  BlendMode.srcIn,
                ),
                // add any image here
                child: Image.asset("images/dragon.png"),
              )))
    ])));
  }
}
