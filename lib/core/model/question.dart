import 'package:hive/hive.dart';

part 'question.g.dart';

@HiveType(typeId: 0)
class Question extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String quizId;

  @HiveField(2)
  final String topicId;

  @HiveField(3)
  final String? subTopicId;

  @HiveField(4)
  final String question;

  @HiveField(5)
  final List<String> options;

  @HiveField(6)
  final int correctIndex;

  @HiveField(7)
  final String explanation;

  @HiveField(8)
  final String difficulty;

  @HiveField(9)
  final bool isActive;

  @HiveField(10)
  final List<String>? tags;

  @HiveField(11)
  final String? reference;

  Question({
    required this.id,
    required this.quizId,
    required this.topicId,
    this.subTopicId,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.difficulty,
    required this.isActive,
    this.tags,
    this.reference,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] ?? '',
      quizId: json['quizId'] ?? '',
      topicId: json['topicId'] ?? '',
      subTopicId: json['subTopicId'],
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correctIndex: json['correctIndex'] ?? 0,
      explanation: json['explanation'] ?? '',
      difficulty: json['difficulty'] ?? 'easy',
      isActive: json['isActive'] ?? true,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      reference: json['reference'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quizId': quizId,
      'topicId': topicId,
      'subTopicId': subTopicId,
      'question': question,
      'options': options,
      'correctIndex': correctIndex,
      'explanation': explanation,
      'difficulty': difficulty,
      'isActive': isActive,
      'tags': tags,
      'reference': reference,
    };
  }
}
