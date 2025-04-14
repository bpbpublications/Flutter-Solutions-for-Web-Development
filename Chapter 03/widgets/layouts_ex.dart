import 'package:flutter/material.dart';

// container
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 100,
      height: 100,
      child: const Text('Kaladin'),
    );
  }
}

// center
class MyCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sylphrena'),
    );
  }
}

// Align
class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomRight,
      child: Text('Adolin'),
    );
  }
}

// expanded
class MyExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(color: Colors.blue, height: 100),
        ),
        Expanded(
          child: Container(color: Colors.red, height: 100),
        ),
      ],
    );
  }
}

// column
class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Text('Dalinar'),
        Text('Jasnah'),
        Text('Shallan'),
      ],
    );
  }
}

// row
class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text('Renarin'),
        Text('Szeth'),
        Text('Lift'),
      ],
    );
  }
}

// stack
class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 25,
          height: 25,
        ),
      ],
    );
  }
}

// ListView
class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text('Hoid'),
        Text('Dalinar'),
        Text('Shallan'),
      ],
    );
  }
}

// gridview
class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: const [
        Text('Kaladin'),
        Text('Adolin'),
        Text('Jasnah'),
        Text('Renarin'),
      ],
    );
  }
}

// positioned
class MyPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.green, width: 200, height: 200),
        Positioned(
          top: 50,
          left: 50,
          child: Text('Navani'),
        ),
      ],
    );
  }
}

// LayoutBuilder
class MyLayoutBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              Expanded(child: Container(color: Colors.red)),
              Expanded(child: Container(color: Colors.green)),
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(child: Container(color: Colors.red)),
              Expanded(child: Container(color: Colors.green)),
            ],
          );
        }
      },
    );
  }
}
