import 'package:flutter/material.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/core/router/app_navigator.dart';
import 'package:it_mcq/core/router/routes_name.dart';
import 'package:it_mcq/features/quiz/custom_text.dart';
class QuizResultPage extends StatelessWidget {
  final List<Question> quizList;
  final Map<int, int?> userAnswers; // Changed to nullable

  QuizResultPage({
    super.key,
    required this.quizList,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    int answered = 0;
    int unanswered = 0;
    
    for (int i = 0; i < quizList.length; i++) {
      final userAnswer = userAnswers[i];
      if (userAnswer != null) {
        answered++;
        if (quizList[i].correctIndex == userAnswer) {
          correct++;
        }
      } else {
        unanswered++;
      }
    }
    
    int totalQuestions = quizList.length;
    int incorrect = answered - correct; // Only count answered questions as incorrect
    double score = correct - (incorrect * 0.25);
    int coins = correct * 10;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "Quiz Result",
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 20),

              // Trophy Image
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/icons/trophy.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const CustomText(
                        text: "WINNER",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Congratulations
              const CustomText(
                text: "Congratulations!",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              const CustomText(
                text: "You have completed the quiz successfully.",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              const SizedBox(height: 8),
              
              // Stats with unanswered questions
              CustomText(
                text: "Correct: $correct | Incorrect: $incorrect | Unanswered: $unanswered",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              const SizedBox(height: 24),

              // Score
              const CustomText(
                text: "YOUR SCORE",
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              const SizedBox(height: 6),
              CustomText(
                text: "${score.toStringAsFixed(2)} / $totalQuestions",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
              const SizedBox(height: 24),

              // Earned Coins
              const CustomText(
                text: "EARNED COINS",
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.monetization_on,
                    color: Colors.amber,
                    size: 24,
                  ),
                  const SizedBox(width: 6),
                  CustomText(
                    text: "$coins Coins",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                      AppNavigator.goHomeAndClearStack(context);
                      },
                      icon: const Icon(Icons.home),
                      label: const Text("Topics List"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.examAnswer,
                          arguments: {
                            'quizList': quizList,
                            'userAnswers': userAnswers,
                          },
                        );
                      },
                      child: const Text("Answer Sheet"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Close Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
