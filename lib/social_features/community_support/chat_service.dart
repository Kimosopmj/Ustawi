import 'package:flutter/material.dart';
import 'package:myapp/mock_database.dart';
import 'package:myapp/models/chat_message.dart';

class ChatService extends StatefulWidget {
  @override
  _ChatServiceState createState() => _ChatServiceState();
}

class _ChatServiceState extends State<ChatService> {
  final TextEditingController _controller = TextEditingController();

  void _editMessage(BuildContext context, int index) {
    final message = mockDatabase.chatMessages[index];
    final _formKey = GlobalKey<FormState>();
    String _editedMessage = message.text;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit Message'),
        content: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: _editedMessage,
            decoration: InputDecoration(labelText: 'Message'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a message';
              }
              return null;
            },
            onSaved: (value) {
              _editedMessage = value!;
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
                  mockDatabase.updateChatMessage(index, ChatMessage(text: _editedMessage, timestamp: message.timestamp, likes: message.likes, comments: message.comments));
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

  void _deleteMessage(int index) {
    setState(() {
      mockDatabase.deleteChatMessage(index);
    });
  }

  void _addComment(BuildContext context, int index) {
    final _commentFormKey = GlobalKey<FormState>();
    String _commentContent = '';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Add Comment'),
        content: Form(
          key: _commentFormKey,
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Comment'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a comment';
              }
              return null;
            },
            onSaved: (value) {
              _commentContent = value!;
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
              if (_commentFormKey.currentState!.validate()) {
                _commentFormKey.currentState!.save();
                setState(() {
                  mockDatabase.chatMessages[index].comments.add(Comment(user: 'User', content: _commentContent, timestamp: DateTime.now()));
                });
                Navigator.of(ctx).pop();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: mockDatabase.chatMessages.length,
            itemBuilder: (ctx, index) {
              final message = mockDatabase.chatMessages[index];
              return Card(
                child: ListTile(
                  title: Text(message.text),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Likes: ${message.likes}'),
                      Text('Comments: ${message.comments.length}'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: message.comments.map((comment) => Text('${comment.user}: ${comment.content}')).toList(),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () {
                          setState(() {
                            message.likes++;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editMessage(context, index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteMessage(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.comment),
                        onPressed: () => _addComment(context, index),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter message',
                    filled: true,
                    fillColor: Colors.white54,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  setState(() {
                    mockDatabase.addChatMessage(ChatMessage(text: _controller.text, timestamp: DateTime.now()));
                    _controller.clear();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
