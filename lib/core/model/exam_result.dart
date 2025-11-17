import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:it_mcq/core/model/answer_model.dart';

class ExamResult {
  final String userId;
  final String topicsId;
  final String examId;
  final List<String> questionsId;
  final int score;
  final int submittedAt;
  final List<Answer> answers;

  ExamResult({
    required this.userId,
    required this.examId,
    required this.score,
    required this.topicsId,
    required this.questionsId,
    required this.submittedAt,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'examId': examId,
      'topicsId': topicsId,
      'questionsId': questionsId,
      'score': score,
      'submittedAt': submittedAt,
      'answers': answers.map((a) => a.toMap()).toList(),
    };
  }

  factory ExamResult.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ExamResult(
      userId: data['userId'] ?? '',
      examId: data['examId'] ?? '',
      topicsId: data['topicsId'] ?? '',
      questionsId: (data['questionsId'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      score: data['score'] ?? 0,
      submittedAt: data['submittedAt'],
      answers: (data['answers'] as List<dynamic>)
          .map((e) => Answer.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}
