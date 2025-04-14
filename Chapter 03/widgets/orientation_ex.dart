import 'package:flutter/material.dart';

class OrientationBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationBuilder Example'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Text('Portrait Mode');
          } else {
            return Text('Landscape Mode');
          }
        },
      ),
    );
  }
}
