
import 'package:flutter/material.dart';
import 'components/mood_analytics_body.dart';

class MoodAnalytics extends StatelessWidget {
  const MoodAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoodAnalytics'),
      ),
      body: MoodAnalyticsBody(),
    );
  }
}
    