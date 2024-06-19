import 'package:flutter/foundation.dart';

class Comment {
  final String text;
  final DateTime timestamp;

  Comment({required this.text, required this.timestamp});

  Comment copyWith({String? text, DateTime? timestamp}) {
    return Comment(
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
