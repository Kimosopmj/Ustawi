// class Thought {
//   String content;
//   DateTime date;
//   bool isStarred;

//   Thought({required this.content, required this.date, this.isStarred = false});
// }

// class Thought {
//   String id;
//   String content;
//   DateTime timestamp;
//   bool isStarred;


//   Thought({required this.id, required this.content, required this.timestamp, this.isStarred = false});
// }

// class Thought {
//   String id;
//   String content;
//   DateTime timestamp;

//   Thought({required this.id, required this.content, required this.timestamp});
// }

// class Thought {
//   String content;
//   DateTime date;

//   Thought({required this.content, required this.date});
// }

class Thought {
  String content;
  DateTime date;
  bool isStarred; // New field

  Thought({required this.content, required this.date, this.isStarred = false});
}

