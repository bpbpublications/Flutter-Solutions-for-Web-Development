import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: DraggableCard(),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({super.key});

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;
  Alignment _dragAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _dragAlignment = Alignment.center;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation(Offset velocity) {
    final unitsPerSecondX = velocity.dx / MediaQuery.of(context).size.width;
    final unitsPerSecondY = velocity.dy / MediaQuery.of(context).size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 5, // Reduced mass for more responsiveness
      stiffness: 1000, // Increased stiffness for a stronger spring effect
      damping: 1, // Increased damping for a quicker stop
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (MediaQuery.of(context).size.width / 2),
            details.delta.dy / (MediaQuery.of(context).size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond);
      },
      child: Align(
        alignment: _dragAlignment,
        child: const Card(
          color: Colors.blue,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Center(
              child: Text(
                'Drag me!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
