
import 'package:flutter/material.dart';
import 'components/mood_logging_body.dart';

class MoodLogging extends StatelessWidget {
  const MoodLogging({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoodLogging'),
      ),
      body: const MoodLoggingBody(),
    );
  }
}
  