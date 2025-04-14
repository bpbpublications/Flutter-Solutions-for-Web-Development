import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoadingSpinner(),
  ));
}

class LoadingSpinner extends StatefulWidget {
  @override
  _LoadingSpinnerState createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<LoadingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Loading...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * 3.14,
                  child: const SizedBox(
                    width: 20,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeCap: StrokeCap.round,
                      semanticsLabel: 'Loading...',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
