import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/subtopics.dart';
import 'package:it_mcq/data/sub_topics.dart';
import 'package:it_mcq/features/subtopics/cubit/sub_topic_state.dart';

class SubTopicCubit extends Cubit<SubTopicState> {
  SubTopicCubit() : super(SubTopicInitial());

  Future<void> loadSubTopics({required String topicId}) async {
    emit(SubTopicLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      List<Map<String, dynamic>>? topicData;

      switch (topicId) {
        case "t001":
          topicData = t001;
          break;
        case "t002":
          topicData = t002;
          break;
        case "t003":
          topicData = t003;
          break;
        case "t004":
          topicData = t004;
          break;
        case "t005":
          topicData = t005;
          break;
        case "t006":
          topicData = t006;
          break;
        case "t007":
          topicData = t007;
          break;
        case "t008":
          topicData = t008;
          break;
        default:
          emit(SubTopicError("Invalid topic ID: $topicId"));
          return;
      }

      if (topicData == null || topicData.isEmpty) {
        emit(SubTopicError("No subtopics found for $topicId"));
        return;
      }

      final subtopics = topicData.map((e) => SubTopic.fromJson(e)).toList();

      emit(SubTopicLoaded(subtopics));
    } catch (e) {
      emit(SubTopicError("Failed to load subtopics: $e"));
    }
  }
}
