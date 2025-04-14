// svg code
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'images/icon.svg',
          semanticsLabel: 'Knight',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: SvgExample(),
    ),
  );
}
