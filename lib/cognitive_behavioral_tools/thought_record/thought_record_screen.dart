import 'package:flutter/material.dart';
import 'thought_entry.dart';
import 'thought_list.dart';

class ThoughtRecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thought Record')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/emoji.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          Column(
            children: [
              Expanded(child: ThoughtEntry()),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThoughtListScreen()),
                  );
                },
                child: Text('View Saved Thoughts'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
