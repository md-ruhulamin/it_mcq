import 'package:flutter/material.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/core/router/routes_name.dart';
import 'package:it_mcq/features/auth/presentation/login_scaffold.dart';
import 'package:it_mcq/features/auth/presentation/registration.dart';
import 'package:it_mcq/features/home/dash_board.dart';
import 'package:it_mcq/features/home/home_page.dart';
import 'package:it_mcq/features/quiz/answer.dart';
import 'package:it_mcq/features/quiz/quiz_practice_screen.dart';
import 'package:it_mcq/features/quiz/quiz_result.dart';
import 'package:it_mcq/features/quiz/quiz_list_screen.dart';
import 'package:it_mcq/features/quiz/live_quiz_screen.dart';
import 'package:it_mcq/features/subtopics/sub_topics_screen.dart';
import 'package:it_mcq/features/topics/topics_list.dart';
import 'package:it_mcq/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      case RoutesName.registration:
        return MaterialPageRoute(
          builder: (BuildContext context) => Registration(),
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScaffold(),
        );
      case RoutesName.topicsList:
        return MaterialPageRoute(
          builder: (BuildContext context) => TopicListScreen(),
        );
      case RoutesName.quizList:
        return MaterialPageRoute(
          builder: (BuildContext context) => const QuizListScreen(),
        );

      case RoutesName.liveQuiz:
        final args = settings.arguments as Map<String, String>;
        String topicsId = args["topicsId"] ?? " ";
        return MaterialPageRoute(
          builder: (BuildContext context) => LiveQuizScreen(topicsId: topicsId),
        );
      case RoutesName.dhashBoard:
        return MaterialPageRoute(
          builder: (BuildContext context) => Dashboard(),
        );

      case RoutesName.practiceScreen:
        final args = settings.arguments as Map<String, String>;
        String topicsId = args["topicsId"] ?? " ";
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              QuizPracticeScreen(topicId: topicsId),
        );
      case RoutesName.subtopics:
        final args = settings.arguments as Map<String, String>;
        String topicsId = args["topicsId"] ?? " ";
        return MaterialPageRoute(
          builder: (BuildContext context) => SubTopicsPage(topicsId: topicsId),
        );

      case RoutesName.examAnswer:
        final args = settings.arguments as Map<String, dynamic>;
        final quizList = args['quizList'] as List<Question>;
        final userAnswers = args['userAnswers'] as Map<int, int?>;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              AnswerSheetScreen(quizList: quizList, userAnswers: userAnswers),
        );

      case RoutesName.resultSummary:
        final args = settings.arguments as Map<String, dynamic>;
        final quizList = args['quizList'] as List<Question>;
        final userAnswers = args['userAnswers'] as Map<int, int?>;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              QuizResultPage(quizList: quizList, userAnswers: userAnswers),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
