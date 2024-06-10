import 'package:flutter/material.dart';
import 'package:ustawi/taskscreens/landingpage.dart';

void main() {
  runApp(MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ustawi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(), // Set the landing page as the home screen
    );
  }
}
