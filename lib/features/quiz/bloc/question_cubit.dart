import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/core/model/topic_model.dart';
import 'package:it_mcq/data/computer_architecture.dart';
import 'package:it_mcq/data/database.dart';
import 'package:it_mcq/data/dsa.dart';
import 'package:it_mcq/utility/widgets/widgets.dart';



// question_mapping.dart
final Map<String, List<Map<String, dynamic>>> idToQuestionDataMapping = {
  "t001": dsquestion,
  "t002": algorithmQuestions,
  "t003": programmingQuestions,
  "t004": databaseQuestions,
  "t005": osQuestions,
  "t006": networkQuestions,
  "t007": computerArchitectureQuestions,
  "t008": securityQuestions,
};

// question_cubit.dart
class QuestionCubit extends Cubit<List<Question>> {
  QuestionCubit() : super([]);

  Future<void> loadQuestions({required String topicsId}) async {
    try {
      final questionData = idToQuestionDataMapping[topicsId];
      
      if (questionData == null || questionData.isEmpty) {
        showCustomToasts(msg: "No questions available for this topic");
        return;
      }

      final questions = questionData.map((e) => Question.fromJson(e)).toList();
      emit(questions);
    } catch (e) {
      showCustomToasts(msg: "Error loading questions: $e");
      print("Error in loadQuestions: $e");
    }
  }
}