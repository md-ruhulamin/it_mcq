import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/topic_model.dart';

class TopicCubit extends Cubit<List<TopicModel>> {
  TopicCubit() : super([]);

  Future<void> loadTopics() async {
   final data = [
  {
    "id": "t001",
    "title": "Data Structure",
    "progress": 0,
    "subtopics": 6,
    "questions": 5022,
    "isFavorite": false,
  },
  {
    "id": "t002",
    "title": "Algorithm",
    "progress": 0,
    "subtopics": 8,
    "questions": 863,
    "isFavorite": false,
  },
  {
    "id": "t003",
    "title": "Programming",
    "progress": 0,
    "subtopics": 5,
    "questions": 3120,
    "isFavorite": true,
  },
  {
    "id": "t004",
    "title": "Database",
    "progress": 0,
    "subtopics": 3,
    "questions": 5164,
    "isFavorite": true,
  },
  {
    "id": "t005",
    "title": "Operating System",
    "progress": 0,
    "subtopics": 4,
    "questions": 2083,
    "isFavorite": false,
  },
  {
    "id": "t006",
    "title": "Networks",
    "progress": 0,
    "subtopics": 7,
    "questions": 1894,
    "isFavorite": false,
  },
  {
    "id": "t007",
    "title": "Computer Arc.",
    "progress": 0,
    "subtopics": 2,
    "questions": 2470,
    "isFavorite": false,
  },
  {
    "id": "t008",
    "title": "Security",
    "progress": 0,
    "subtopics": 6,
    "questions": 1320,
    "isFavorite": true,
  },
  {
    "id": "t009",
    "title": "Computer Fund..",
    "subtopics": 5,
    "progress": 0,
    "questions": 980,
    "isFavorite": false,
  },
  {
    "id": "t010",
    "title": "Software Engg.",
    "progress": 0,
    "subtopics": 9,
    "questions": 2260,
    "isFavorite": false,
  },
];

    emit(data.map((e) => TopicModel.fromJson(e)).toList());
  }

  void toggleFavorite(String id) {
    final updatedList = state.map((topic) {
      if (topic.id == id) {
        return TopicModel(
          id: topic.id,
          title: topic.title,
          progress: topic.progress,
          subtopics: topic.subtopics,
          questions: topic.questions,
          isFavorite: !topic.isFavorite,
        );
      }
      return topic;
    }).toList();
    emit(updatedList);
  }
}
