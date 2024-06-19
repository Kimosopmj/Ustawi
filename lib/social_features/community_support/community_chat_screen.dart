import 'package:flutter/material.dart';
import 'package:myapp/mock_database.dart';
import 'package:myapp/models/chat_message.dart';
import 'package:myapp/models/comment.dart';

class CommunityChatScreen extends StatefulWidget {
  @override
  _CommunityChatScreenState createState() => _CommunityChatScreenState();
}

class _CommunityChatScreenState extends State<CommunityChatScreen> {
  final TextEditingController _controller = TextEditingController();

  void _addMessage(String text) {
    setState(() {
      mockDatabase.addChatMessage(ChatMessage(
        text: text,
        timestamp: DateTime.now(),
        comments: [],
      ));
    });
    _controller.clear();
  }

  void _editMessage(int index, String newText) {
    setState(() {
      mockDatabase.updateChatMessage(
        index,
        mockDatabase.chatMessages[index].copyWith(text: newText),
      );
    });
  }

  void _deleteMessage(int index) {
    setState(() {
      mockDatabase.deleteChatMessage(index);
    });
  }

  void _addComment(int messageIndex, String commentText) {
    setState(() {
      mockDatabase.chatMessages[messageIndex].comments.add(
        Comment(text: commentText, timestamp: DateTime.now()),
      );
    });
  }

  void _editComment(int messageIndex, int commentIndex, String newText) {
    setState(() {
      mockDatabase.chatMessages[messageIndex].comments[commentIndex] =
          mockDatabase.chatMessages[messageIndex].comments[commentIndex]
              .copyWith(text: newText);
    });
  }

  void _deleteComment(int messageIndex, int commentIndex) {
    setState(() {
      mockDatabase.chatMessages[messageIndex].comments.removeAt(commentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community Chat')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/welcome_image.jpeg',
            fit: BoxFit.fitHeight,
          ),
          Container(
            color: Colors.black54,
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: mockDatabase.chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = mockDatabase.chatMessages[index];
                    return Card(
                      child: ListTile(
                        title: Text(message.text),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(message.timestamp.toString()),
                            if (message.comments.isNotEmpty)
                              ...message.comments.map((comment) => ListTile(
                                    title: Text(comment.text),
                                    subtitle:
                                        Text(comment.timestamp.toString()),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            _showEditCommentDialog(
                                                context, index, comment);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            _deleteComment(
                                                index,
                                                message.comments
                                                    .indexOf(comment));
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _showEditMessageDialog(context, index, message);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteMessage(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.comment),
                              onPressed: () {
                                _showAddCommentDialog(context, index);
                              },
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
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => _addMessage(_controller.text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showEditMessageDialog(
      BuildContext context, int index, ChatMessage message) {
    final TextEditingController editController =
        TextEditingController(text: message.text);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Message'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: 'Edit your message'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _editMessage(index, editController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showEditCommentDialog(
      BuildContext context, int messageIndex, Comment comment) {
    final TextEditingController editController =
        TextEditingController(text: comment.text);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Comment'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: 'Edit your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _editComment(messageIndex,
                    mockDatabase.chatMessages[messageIndex].comments
                        .indexOf(comment),
                    editController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAddCommentDialog(BuildContext context, int messageIndex) {
    final TextEditingController commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(labelText: 'Enter your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addComment(messageIndex, commentController.text);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
