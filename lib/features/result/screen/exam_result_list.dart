// screens/exam_result_list_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:it_mcq/core/model/answer_model.dart';
import 'package:it_mcq/core/model/exam_result.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/data/mcq/computer_architecture_mcq.dart';
import 'package:it_mcq/data/mcq/database_mcq.dart';
import 'package:it_mcq/data/mcq/dsa_mcq.dart';
import 'package:it_mcq/data/topics_maping.dart';
import 'package:it_mcq/features/quiz/answer.dart';
import 'package:it_mcq/features/quiz/bloc/question_cubit.dart';
import 'package:it_mcq/features/result/cubit/exam_cubit.dart';
import 'package:it_mcq/features/result/cubit/exam_result_state.dart';

class ExamResultListPage extends StatefulWidget {
  final String userId;
  const ExamResultListPage({super.key, required this.userId});

  @override
  State<ExamResultListPage> createState() => _ExamResultListPageState();
}

class _ExamResultListPageState extends State<ExamResultListPage> {
  String _formatDateTime(dynamic timestamp) {
    try {
      DateTime dateTime;

      if (timestamp is int) {
        // Handle int as milliseconds since epoch
        dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      } else if (timestamp is Timestamp) {
        dateTime = timestamp.toDate();
      } else if (timestamp is String) {
        dateTime = DateTime.parse(timestamp);
      } else {
        return 'N/A';
      }

      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays == 0) {
        return 'Today at ${DateFormat('h:mm a').format(dateTime)}';
      } else if (difference.inDays == 1) {
        return 'Yesterday at ${DateFormat('h:mm a').format(dateTime)}';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else {
        return DateFormat('MMM dd, yyyy').format(dateTime);
      }
    } catch (e) {
      return 'N/A';
    }
  }

  Map<String, int> _calculateStats(ExamResult result) {
    int correct = 0;
    int wrong = 0;
    int unanswered = 0;

    final allQuestions = idToQuestionDataMapping[result.topicsId]!
        .map((q) => Question.fromJson(q))
        .toList();

    final quizList = allQuestions
        .where((q) => result.questionsId.contains(q.id))
        .toList();

    for (var question in quizList) {
      final answer = result.answers.firstWhere(
        (a) => a.questionId == question.id,
        orElse: () => Answer(questionId: '', selectedIndex: -1),
      );

      if (answer.selectedIndex == -1) {
        unanswered++;
      } else if (answer.selectedIndex == question.correctIndex) {
        correct++;
      } else {
        wrong++;
      }
    }

    return {
      'correct': correct,
      'wrong': wrong,
      'unanswered': unanswered,
      'total': quizList.length,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExamResultCubit()..loadUserResults(widget.userId),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            "My Exam Results",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<ExamResultCubit, ExamResultState>(
          builder: (context, state) {
            if (state is ExamResultLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExamResultFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.error,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ExamResultLoaded) {
              final results = state.results;

              if (results.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: 80,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No results found",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Complete an exam to see your results here",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  final stats = _calculateStats(result);
                  final percentage =
                      ((stats['correct']! / stats['total']!) * 100)
                          .toStringAsFixed(1);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          final allQuestions =
                              idToQuestionDataMapping[result.topicsId]!
                                  .map((q) => Question.fromJson(q))
                                  .toList();

                          final quizList = allQuestions
                              .where((q) => result.questionsId.contains(q.id))
                              .toList();

                          final Map<int, int?> userAnswers = {};
                          for (int i = 0; i < quizList.length; i++) {
                            final question = quizList[i];
                            final answer = result.answers.firstWhere(
                              (a) => a.questionId == question.id,
                              orElse: () =>
                                  Answer(questionId: '', selectedIndex: -1),
                            );
                            // Only add to map if answer was actually selected (not -1)
                            if (answer.selectedIndex != -1) {
                              userAnswers[i] = answer.selectedIndex;
                            } else {
                              userAnswers[i] =
                                  null; // Explicitly set as unanswered
                            }
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AnswerSheetScreen(
                                quizList: quizList,
                                userAnswers: userAnswers,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header Row
                              Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.assignment_turned_in,
                                      color: Colors.blue.shade600,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Exam #${index + 1}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Text(
                                              _formatDateTime(
                                                result.submittedAt,
                                              ),
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          topicsMap[result.topicsId] ?? " ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),

                              SizedBox(height: 5),
                              // Score Display
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.school,
                                          color: Colors.blue.shade700,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "Score",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "$percentage%",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),

                              // Statistics Row
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildStatItem(
                                      Icons.check_circle,
                                      stats['correct']!,
                                      "Correct",
                                      Colors.green.shade600,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _buildStatItem(
                                      Icons.cancel,
                                      stats['wrong']!,
                                      "Wrong",
                                      Colors.red.shade600,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _buildStatItem(
                                      Icons.remove_circle_outline,
                                      stats['unanswered']!,
                                      "Skipped",
                                      Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, int count, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 11, color: color)),
        ],
      ),
    );
  }
}
