import 'package:flutter/material.dart';
import 'package:it_mcq/core/model/question.dart';
import 'routes_name.dart'; // Your route name constants

class AppNavigator {
  static void goToSplash(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.splash_screen);
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.login);
  }

  static void goToRegistration(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.registration);
  }

  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.home);
  }

  static void goToDashBoard(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.dhashBoard);
  }

  static void goToTopicsList(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.topicsList);
  }

  static void goToQuizList(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.quizList);
  }

  static void goToQuizPractice(
    BuildContext context, {
    required String topicsId,
  }) {
    Navigator.pushNamed(
      context,
      RoutesName.practiceScreen,
      arguments: {'topicsId': topicsId},
    );
  }

  static void goToLiveQuiz(BuildContext context, {required String topicsId}) {
    Navigator.pushNamed(
      context,
      RoutesName.liveQuiz,
      arguments: {'topicsId': topicsId},
    );
  }

  static void goToSubtopics(BuildContext context, {required String topicsId}) {
    Navigator.pushNamed(
      context,
      RoutesName.subtopics,
      arguments: {'topicsId': topicsId},
    );
  }

  static void goToAnswerSheet(
    BuildContext context, {
    required List<Question> quizList,
    required Map<int, int> userAnswers,
  }) {
    Navigator.pushNamed(
      context,
      RoutesName.examAnswer,
      arguments: {'quizList': quizList, 'userAnswers': userAnswers},
    );
  }

  static void goToResultSummary(
    BuildContext context, {
    required List<Question> quizList,
    required Map<int, int?> userAnswers,
  }) {
    Navigator.pushReplacementNamed(
      context,
      RoutesName.resultSummary,
      arguments: {'quizList': quizList, 'userAnswers': userAnswers},
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void goHomeAndClearStack(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.dhashBoard,
      (route) => false,
    );
  }
}
