import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/answer_model.dart';

import 'package:it_mcq/core/model/exam_result.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/core/router/app_navigator.dart';
import 'package:it_mcq/data/topics_maping.dart';
import 'package:it_mcq/features/bookmark/bookmark_cubit.dart';
import 'package:it_mcq/features/quiz/bloc/question_cubit.dart';
import 'package:it_mcq/features/quiz/custom_text.dart';
import 'package:it_mcq/features/result/cubit/exam_cubit.dart';
import 'package:it_mcq/features/result/cubit/exam_result_state.dart';
import 'package:it_mcq/utility/widgets/widgets.dart';
import '../../../core/theme/theme_cubit.dart';

class LiveQuizScreen extends StatefulWidget {
  String topicsId;
  LiveQuizScreen({super.key, required this.topicsId});

  @override
  State<LiveQuizScreen> createState() => _LiveQuizScreenState();
}

class _LiveQuizScreenState extends State<LiveQuizScreen> {
  // Track user's selected answers for each question
  Map<String, int?> userAnswers = {};
  bool showAnswerAll = false;
  Map<int, int?> userAns = {};

  // Track which questions have "Show Answer" clicked
  Map<String, bool> showAnswers = {};

  int _getAnsweredCount() {
    return userAnswers.values.where((answer) => answer != null).length;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              QuestionCubit()..loadQuestions(topicsId: widget.topicsId),
        ),
        BlocProvider(create: (context) => ExamResultCubit()),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            topicsMap[widget.topicsId]!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
        ),
        body: BlocBuilder<QuestionCubit, List<Question>>(
          builder: (context, questions) {
            if (questions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                // Info Banner
                Container(
                  width: double.infinity,
                  color: Colors.blue.shade50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CountdownPage(startMinutes: questions.length),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.only(
                          right: 12,
                          top: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green.shade700,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${_getAnsweredCount()}/${questions.length}',
                              style: TextStyle(
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Questions List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return QuestionCard(
                        questionNumber: index + 1,
                        question: questions[index],
                        selectedAnswer: userAnswers[questions[index].id],
                        showAnswer: showAnswers[questions[index].id] ?? false,
                        onAnswerSelected: (optionIndex) {
                          setState(() {
                            userAnswers[questions[index].id] = optionIndex;
                            userAns[index] = optionIndex;
                          });
                        },
                        onShowAnswer: () {
                          setState(() {
                            showAnswers[questions[index].id] = true;
                          });
                        },
                        onHideAnswer: () {
                          setState(() {
                            showAnswers[questions[index].id] = false;
                          });
                        },
                      );
                    },
                  ),
                ),

                // Submit Button with BLoC Listener
                BlocConsumer<ExamResultCubit, ExamResultState>(
                  listener: (context, state) {
                    // ✅ FIX 1: Proper listener with navigation
                    if (state is ExamResultSuccess) {
                      // Hide loading dialog if shown
                      Navigator.of(context, rootNavigator: true).pop();

                      showCustomToasts(msg: "Exam submitted successfully!");

                      // Navigate to result screen
                      Future.delayed(const Duration(milliseconds: 500), () {
                        AppNavigator.goToResultSummary(
                          context,
                          quizList: questions,
                          userAnswers: userAns,
                        );
                      });
                    } else if (state is ExamResultFailure) {
                      // Hide loading dialog if shown
                      Navigator.of(context, rootNavigator: true).pop();

                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error: ${state.error}"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (state is ExamResultLoading) {
                      // ✅ FIX 2: Show loading dialog
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return WillPopScope(
                            onWillPop: () async => false,
                            child: Dialog(
                              backgroundColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CircularProgressIndicator(),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Submitting your answers...',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              // ✅ FIX 3: Disable button while loading
                              onPressed: state is ExamResultLoading
                                  ? null
                                  : () {
                                      _showSubmitDialog(context, questions);
                                    },
                              icon: const Icon(Icons.check_circle_outline),
                              label: const Text('Submit'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                backgroundColor: Colors.blue.shade600,
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ✅ FIX 4: Separate method for submit dialog
  void _showSubmitDialog(BuildContext context, List<Question> questions) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  size: 48,
                  color: Colors.blue[600],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Submit Quiz?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'Your answers will be submitted and you can view the results.',
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.grey[300]!),
                      ),
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(dialogContext).pop();

                        // ✅ FIX 5: Call submit with proper context
                        _submitExam(context, questions, widget.topicsId);
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitExam(
    BuildContext context,
    List<Question> questions,
    String topicsId,
  ) {
    try {
      final userId = "user_123"; // Replace with actual logged-in user ID
      final examId = questions.first.quizId;

      // Step 1: Calculate score
      int score = 0;
      for (var q in questions) {
        final userIndex = userAnswers[q.id];
        if (userIndex != null && userIndex == q.correctIndex) {
          score++;
        }
      }

      // Step 2: Prepare answer list
      final answers = userAnswers.entries
          .map((e) => Answer(questionId: e.key, selectedIndex: e.value ?? -1))
          .toList();

      // Step 3: Extract questionId list
      final questionsId = questions.map((q) => q.id).toList();

      // Step 4: Create result model
      final result = ExamResult(
        userId: userId,
        examId: examId,
        topicsId: topicsId,
        questionsId: questionsId,
        score: score,
        submittedAt: DateTime.now().millisecondsSinceEpoch,
        answers: answers,
      );

      // Step 5: Upload result
      context.read<ExamResultCubit>().uploadExamResult(result);
    } catch (e) {
      showCustomToasts(msg: "Error preparing submission: $e");
    }
  }
}

class QuestionCard extends StatelessWidget {
  final int questionNumber;
  final Question question;
  final int? selectedAnswer;
  final bool showAnswer;
  final Function(int) onAnswerSelected;
  final VoidCallback onShowAnswer;
  final VoidCallback onHideAnswer;

  const QuestionCard({
    super.key,
    required this.questionNumber,
    required this.question,
    required this.selectedAnswer,
    required this.showAnswer,
    required this.onAnswerSelected,
    required this.onShowAnswer,
    required this.onHideAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAnswered = selectedAnswer != null;
    final bool isCorrect =
        isAnswered && selectedAnswer == question.correctIndex;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: showAnswer
              ? (isCorrect ? Colors.green.shade200 : Colors.red.shade200)
              : Colors.grey.shade200,
          width: showAnswer ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: showAnswer
                  ? (isCorrect ? Colors.green.shade50 : Colors.red.shade50)
                  : Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: showAnswer
                        ? (isCorrect ? Colors.green : Colors.red)
                        : Colors.blue.shade600,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$questionNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    question.question,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Options
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: List.generate(
                question.options.length,
                (index) => _buildOption(context, index),
              ),
            ),
          ), // Action Buttons
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, int index) {
    final bool isSelected = selectedAnswer == index;
    final bool isCorrectOption = index == question.correctIndex;
    final bool showCorrect = showAnswer && isCorrectOption;
    final bool showWrong = showAnswer && isSelected && !isCorrectOption;

    Color borderColor;
    Color backgroundColor;
    Color textColor;
    Widget? trailingIcon;

    if (showCorrect) {
      borderColor = Colors.green;
      backgroundColor = Colors.green.shade50;
      textColor = Colors.green.shade900;
      trailingIcon = Icon(Icons.check_circle, color: Colors.green, size: 20);
    } else if (showWrong) {
      borderColor = Colors.red;
      backgroundColor = Colors.red.shade50;
      textColor = Colors.red.shade900;
      trailingIcon = Icon(Icons.cancel, color: Colors.red, size: 20);
    } else if (isSelected) {
      borderColor = Colors.blue.shade600;
      backgroundColor = Colors.blue.shade50;
      textColor = Colors.blue.shade900;
      trailingIcon = Icon(
        Icons.check_circle_outline,
        color: Colors.blue.shade600,
        size: 20,
      );
    } else {
      borderColor = Colors.grey.shade300;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      trailingIcon = null;
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () => onAnswerSelected(index),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 2),
                  color: isSelected || showCorrect || showWrong
                      ? borderColor
                      : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D
                    style: TextStyle(
                      color: isSelected || showCorrect || showWrong
                          ? Colors.white
                          : borderColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question.options[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: isSelected || showCorrect
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 8),
                trailingIcon,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class CountdownPage extends StatefulWidget {
  // Start countdown in minutes. For example, 5 means 5 minutes.
  final int startMinutes;

  const CountdownPage({Key? key, required this.startMinutes}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  late int totalSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize total seconds from startMinutes
    totalSeconds = widget.startMinutes * 60;
    _startCountdown();
  }

  void _startCountdown() {
    // If there's already a timer, cancel it (safety)
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          totalSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formattedTime() {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    // Format as MM:SS
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime(),
      style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    );
  }
}
