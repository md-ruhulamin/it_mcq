import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/topic_model.dart';

class TopicCubit extends Cubit<List<TopicModel>> {
  TopicCubit() : super([]);

Future<void> loadTopics() async {
  final data = [
    {
      "id": "1",
      "title": "Data Structure",
      "progress": 0,
      "subtopics": 6,
      "questions": 5022,
      "isFavorite": false
    },
    {
      "id": "2",
      "title": "Algorithm",
      "progress": 0,
      "subtopics": 0,
      "questions": 863,
      "isFavorite": false
    },
    {
      "id": "3",
      "title": "Database",
      "progress": 0,
      "subtopics": 3,
      "questions": 5164,
      "isFavorite": true
    },
    {
      "id": "4",
      "title": "Operating System",
      "progress": 0,
      "subtopics": 0,
      "questions": 2083,
      "isFavorite": false
    },  {
      "id": "4",
      "title": "Networking",
      "progress": 0,
      "subtopics": 0,
      "questions": 2083,
      "isFavorite": false
    } , {
      "id": "4",
      "title": "Computer Architecture",
      "progress": 0,
      "subtopics": 0,
      "questions": 2083,
      "isFavorite": false
    }
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
