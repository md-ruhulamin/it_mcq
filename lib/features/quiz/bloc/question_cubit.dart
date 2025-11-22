import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/core/model/topic_model.dart';
import 'package:it_mcq/data/mcq/algorithm_mcq.dart';
import 'package:it_mcq/data/mcq/computer_architecture_mcq.dart';
import 'package:it_mcq/data/mcq/computer_fundamental_mcq.dart';
import 'package:it_mcq/data/mcq/database_mcq.dart';
import 'package:it_mcq/data/mcq/dsa_mcq.dart';
import 'package:it_mcq/data/mcq/networking_mcq.dart';
import 'package:it_mcq/data/mcq/os_mcq.dart';
import 'package:it_mcq/data/mcq/programming_mcq.dart';
import 'package:it_mcq/data/mcq/security_mcq.dart';
import 'package:it_mcq/utility/widgets/widgets.dart';

// question_mapping.dart
final Map<String, List<Map<String, dynamic>>> idToQuestionDataMapping = {
  "t001": dsMCQquestion,
  "t002": algorithmMCQQuestions,
  "t003": programmingMCQQuestions,
  "t004": databaseMCQQuestions,
  "t005": operatingSystemMCQQuestions,
  "t006": networkMCQQuestions,
  "t007": computerArchitectureMCQQuestions,
  "t008": securityMCQQuestions,
  "t009": computerFundamentalMCQQuestions,
};

// question_cubit.dart
class QuestionCubit extends Cubit<List<Question>> {
  QuestionCubit() : super([]);

  Future<void> loadQuestions({required String topicsId}) async {
    try {
      final questionData = idToQuestionDataMapping[topicsId];
      print("Topics Id $topicsId");
      if (questionData == null || questionData.isEmpty) {
        print("NO datar ");
        showCustomToasts(msg: "No questions available for this topic");
        return;
      }
      print("Data is not empty");
      final questions = questionData.map((e) => Question.fromJson(e)).toList();
      emit(questions);
    } catch (e) {
      showCustomToasts(msg: "Error loading questions: $e");
      print("Error in loadQuestions: $e");
    }
  }
}
