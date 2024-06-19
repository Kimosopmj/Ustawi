import 'package:flutter/material.dart';
import 'package:myapp/mock_database.dart';
import 'package:myapp/models/thought.dart';

class ThoughtEntry extends StatefulWidget {
  @override
  _ThoughtEntryState createState() => _ThoughtEntryState();
}

class _ThoughtEntryState extends State<ThoughtEntry> {
  final _formKey = GlobalKey<FormState>();
  String _thought = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your thought',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white54,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a thought';
                }
                return null;
              },
              onSaved: (value) {
                _thought = value!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    mockDatabase.addThought(Thought(content: _thought, date: DateTime.now()));
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Thought saved')));
                }
              },
              child: Text('Save Thought'),
            ),
          ],
        ),
      ),
    );
  }
}
