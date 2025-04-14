import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnimationDemo(),
  ));
}

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Animation Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Implicit Animation
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _isExpanded ? 200.0 : 100.0,
              height: _isExpanded ? 100.0 : 50.0,
              color: _isExpanded ? Colors.blue : Colors.red,
              child: Center(child: Text('Tap me!')),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Toggle Size'),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            SizedBox(height: 40),
            // Explicit Animation
            RotationTransition(
              turns: _animation,
              child: FlutterLogo(size: 50),
            ),
            SizedBox(height: 40),
            // AnimatedBuilder
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100 * _animation.value),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
