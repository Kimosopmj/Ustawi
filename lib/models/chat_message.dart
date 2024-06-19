// class ChatMessage {
//   String text;
//   DateTime timestamp;

//   ChatMessage({required this.text, required this.timestamp});
// }

// class ChatMessage {
//   String text;
//   DateTime timestamp;
//   int likes; // New field
//   List<Comment> comments; // New field

//   ChatMessage({required this.text, required this.timestamp, this.likes = 0, this.comments = const []});
// }

// class Comment { // New model for comments
//   String user;
//   String content;
//   DateTime timestamp;

//   Comment({required this.user, required this.content, required this.timestamp});
// }

import 'package:flutter/foundation.dart';
import 'comment.dart';

class ChatMessage {
  final String text;
  final DateTime timestamp;
  final int likes; // New field for likes
  final List<Comment> comments; // New field for comments

  // Updated constructor
  ChatMessage({
    required this.text,
    required this.timestamp,
    this.likes = 0, // Default value for likes
    this.comments = const [], // Default value for comments
  });

  // Updated copyWith method
  ChatMessage copyWith({
    String? text,
    DateTime? timestamp,
    int? likes,
    List<Comment>? comments,
  }) {
    return ChatMessage(
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }
}
