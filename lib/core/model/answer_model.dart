// exam_result_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Answer {
  final String questionId;
  final int selectedIndex;

  Answer({required this.questionId, required this.selectedIndex});

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'selectedIndex': selectedIndex,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      questionId: map['questionId'] ?? '',
      selectedIndex: map['selectedIndex'] ?? 0,
    );
  }
}

