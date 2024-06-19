import 'package:flutter/material.dart';
import 'package:myapp/mock_database.dart';
import 'package:myapp/models/thought.dart';

class ThoughtListScreen extends StatefulWidget {
  @override
  _ThoughtListScreenState createState() => _ThoughtListScreenState();
}

class _ThoughtListScreenState extends State<ThoughtListScreen> {
  void _editThought(BuildContext context, int index) {
    final thought = mockDatabase.thoughts[index];
    final _formKey = GlobalKey<FormState>();
    String _editedThought = thought.content;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit Thought'),
        content: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: _editedThought,
            decoration: InputDecoration(labelText: 'Thought'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a thought';
              }
              return null;
            },
            onSaved: (value) {
              _editedThought = value!;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  mockDatabase.updateThought(index, Thought(content: _editedThought, date: thought.date));
                });
                Navigator.of(ctx).pop();
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteThought(int index) {
    setState(() {
      mockDatabase.deleteThought(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved Thoughts')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/about.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          ListView.builder(
            itemCount: mockDatabase.thoughts.length,
            itemBuilder: (ctx, index) {
              final thought = mockDatabase.thoughts[index];
              return Card(
                child: ListTile(
                  title: Text(thought.content),
                  subtitle: Text(thought.date.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editThought(context, index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteThought(index),
                      ),
                      IconButton(
                        icon: Icon(thought.isStarred ? Icons.star : Icons.star_border),
                        onPressed: () {
                          setState(() {
                            thought.isStarred = !thought.isStarred;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
