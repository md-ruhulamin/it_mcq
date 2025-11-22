import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/subtopics.dart';
import 'package:it_mcq/data/sub_topics_data_list.dart';
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
          topicData = ds_topics;
          break;
        case "t002":
          topicData = algorithm_topics;
          break;
        case "t003":
          topicData = programming_topics;
          break;
        case "t004":
          topicData = database_topics;
          break;
        case "t005":
          topicData = os_topics;
          break;
        case "t006":
          topicData = netwroking_topics;
          break;
        case "t007":
          topicData = computer_architecture_topics;
          break;
        case "t008":
          topicData = information_security_topics;
          break;
        case "t009":
          topicData = computer_fundamental_topics;
          break;
                  case "t010":
          topicData = software_eng_topics;
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
