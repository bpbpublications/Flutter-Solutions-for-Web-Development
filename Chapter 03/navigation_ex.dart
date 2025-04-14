import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => MySecondScreen()),
              );
            },
            child: Text("Second Screen"),
          ),
          SizedBox(width: 25),
        ],
      ),
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MySecondScreen()),
              );
            },
            child: Text('Go to Second Screen'),
          ),
        ),
      ),
    );
  }
}

class MySecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow[200],
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go Back'),
          ),
        ),
      ),
    );
  }
}
