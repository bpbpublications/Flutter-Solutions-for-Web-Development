// main.dart
import 'dart:ui';

import 'package:flower_species_clustering_app/screens/home/flower_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlowerClusteringApp());
}

class FlowerClusteringApp extends StatelessWidget {
  const FlowerClusteringApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Clustering',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FlowerScreen(title: 'Flower species clustering'),
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.unknown,
      }),
    );
  }
}
