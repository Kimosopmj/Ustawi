import 'package:flutter/material.dart';
import 'matching_algorithm.dart';

class PeerMatchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peer Matching')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background_image.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          PeerMatchingAlgorithm(),
        ],
      ),
    );
  }
}
