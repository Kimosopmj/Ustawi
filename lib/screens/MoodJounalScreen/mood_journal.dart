
import 'package:flutter/material.dart';
import 'components/mood_journal_body.dart';

class MoodJournal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoodJournal'),
      ),
      body: MoodJournalBody(),
    );
  }
}
    