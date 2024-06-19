import 'package:flutter/material.dart';
import 'cbt_guide.dart';

class CBTExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CBT Exercises',
          style: TextStyle(
            fontFamily: 'Chivo',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
          backgroundColor: Colors.blueAccent,
          ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/home.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          CBTGuide(),
        ],
      ),
    );
  }
}
