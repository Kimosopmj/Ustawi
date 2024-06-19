import 'package:myapp/models/chat_message.dart';
import 'package:myapp/models/exercise.dart';
import 'package:myapp/models/peer.dart';
import 'package:myapp/models/thought.dart';

class MockDatabase {
  List<Thought> thoughts = [];
  List<Exercise> exercises = [
    // ... existing exercises ...
    Exercise(
      title: 'Exercise 1',
      description: 'Step-by-step guide for Exercise 1',
      steps: [
        'Identify the thought.',
        'Analyze the thought.',
        'Challenge the thought.',
      ],
    ),
    Exercise(
      title: 'Exercise 2',
      description: 'Step-by-step guide for Exercise 2',
      steps: [
        'Recognize the emotion.',
        'Understand the trigger.',
        'Reframe the situation.',
      ],
    ),
    Exercise(
      title: 'Exercise 3',
      description: 'Step-by-step guide for Exercise 3',
      steps: [
        'Identify the problem.',
        'Brainstorm solutions.',
        'Implement a solution.',
      ],
    ),
  ];
  List<ChatMessage> chatMessages = [];
  List<Peer> peers = [
    // ... existing peers ...
    Peer(name: 'Alice', interests: 'Reading'),
    Peer(name: 'Jux', interests: 'Hiking'),
    Peer(name: 'Drupe', interests: 'Baking'),
    Peer(name: 'Marie', interests: 'Biking'),



  ];

  void addThought(Thought thought) {
    thoughts.add(thought);
  }

  void updateThought(int index, Thought updatedThought) {
    if (index >= 0 && index < thoughts.length) {
      thoughts[index] = updatedThought;
    }
  }

  void deleteThought(int index) {
    if (index >= 0 && index < thoughts.length) {
      thoughts.removeAt(index);
    }
  }

  void addChatMessage(ChatMessage message) {
    chatMessages.add(message);
  }

  void updateChatMessage(int index, ChatMessage updatedMessage) {
    if (index >= 0 && index < chatMessages.length) {
      chatMessages[index] = updatedMessage;
    }
  }

  void deleteChatMessage(int index) {
    if (index >= 0 && index < chatMessages.length) {
      chatMessages.removeAt(index);
    }
  }

  Peer? matchPeer(String userInterest) {
    for (var peer in peers) {
      if (peer.interests.contains(userInterest)) {
        return peer;
      }
    }
    return null;
  }
}

final mockDatabase = MockDatabase();
