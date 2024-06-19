import 'package:flutter/material.dart';
import '../../mock_database.dart';

class PeerMatchingAlgorithm extends StatefulWidget {
  @override
  _PeerMatchingAlgorithmState createState() => _PeerMatchingAlgorithmState();
}

class _PeerMatchingAlgorithmState extends State<PeerMatchingAlgorithm> {
  final _formKey = GlobalKey<FormState>();
  String _interest = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your interests',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white54,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your interests';
                }
                return null;
              },
              onSaved: (value) {
                _interest = value!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final matchedPeer = mockDatabase.matchPeer(_interest);
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Matched Peer'),
                      content: Text(
                        matchedPeer != null
                            ? 'Name: ${matchedPeer.name}\nInterests: ${matchedPeer.interests}'
                            : 'No peers available for matching.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Find a Peer Support'),
            ),
          ],
        ),
      ),
    );
  }
}
