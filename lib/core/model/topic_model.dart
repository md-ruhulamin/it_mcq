class TopicModel {
  final String id;
  final String title;
  final double progress;
  final int subtopics;
  final int questions;
  final bool isFavorite;

  TopicModel({
    required this.id,
    required this.title,
    required this.progress,
    required this.subtopics,
    required this.questions,
    this.isFavorite = false,
  });

 factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
  id: json['id'],
  title: json['title'],
  progress: json['progress'].toDouble(),
  subtopics: json['subtopics'],
  questions: json['questions'],
  isFavorite: json['isFavorite'],
);

}
