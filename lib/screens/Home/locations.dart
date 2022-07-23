import 'package:flutter/material.dart';
import '/view_models/background.dart';
import 'dart:math' as math;

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Locations"),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return Container(
              color: randomColor(),
              width: 500,
              height: 500,
            );
          },
        ),
      ),
    );
  }

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
