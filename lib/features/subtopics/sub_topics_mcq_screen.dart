import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/data/sub_topics_maping.dart';
import 'package:it_mcq/data/topics_maping.dart';
import 'package:it_mcq/features/quiz/bloc/question_cubit.dart';
import 'package:it_mcq/features/quiz/quiz_practice_screen.dart';
import 'package:it_mcq/utility/widgets/widgets.dart';

class SubtopicMCQScreen extends StatefulWidget {
  final String subtopicId;

  const SubtopicMCQScreen({super.key, required this.subtopicId});

  @override
  State<SubtopicMCQScreen> createState() => _SubtopicMCQScreenState();
}

class _SubtopicMCQScreenState extends State<SubtopicMCQScreen> {
  Map<String, int?> userAnswers = {};

  bool showAnswerAll = false;

  Map<int, int> userAns = {};

  // Track which questions have "Show Answer" clicked
  Map<String, bool> showAnswers = {};

  int _getAnsweredCount() {
    return userAnswers.values.where((answer) => answer != null).length;
  }

  Set<int> bookmarkedQuestions = {};

  void toggleBookmark(int index) {
    setState(() {
      if (bookmarkedQuestions.contains(index)) {
        bookmarkedQuestions.remove(index);
      } else {
        bookmarkedQuestions.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Sub topics Id ${widget.subtopicId}");

    /// Load MCQs when screen opens
    context.read<SubtopicsMCQCubit>().loadSubtopicQuestions(
      subtopicId: widget.subtopicId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          subtopicsMap[widget.subtopicId] ??
              topicsMap[widget.subtopicId.split("-").first] ??
              " ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: BlocBuilder<SubtopicsMCQCubit, List<Question>>(
        builder: (context, questions) {
          if (questions.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Info Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border(
                    bottom: BorderSide(color: Colors.blue.shade100, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    // Progress with minimal icon
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green.shade600,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${_getAnsweredCount()}/${questions.length}',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            color: Colors.green.shade600,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Practice Mode',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Info text - compact
                    const SizedBox(width: 12),

                    // Compact toggle button
                    SizedBox(
                      height: 32,
                      child: FilledButton.tonal(
                        onPressed: () {
                          setState(() {
                            showAnswerAll = !showAnswerAll;
                            for (final question in questions) {
                              showAnswers[question.id] = showAnswerAll;
                            }
                          });
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: showAnswerAll
                              ? Colors.grey.shade300
                              : Colors.blue.shade100,
                          foregroundColor: showAnswerAll
                              ? Colors.grey.shade700
                              : Colors.blue.shade800,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              showAnswerAll
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              showAnswerAll ? 'Hide All' : 'Show All',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
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
            ],
          );
        },
      ),
    );
  }
}

class SubtopicsMCQCubit extends Cubit<List<Question>> {
  SubtopicsMCQCubit() : super([]);

  Future<void> loadSubtopicQuestions({required String subtopicId}) async {
    try {
      // Flatten all topic lists into one large list
      final allQuestions = idToQuestionDataMapping.values
          .expand((list) => list)
          .toList();

      // Convert JSON → Question model
      final parsedQuestions = allQuestions
          .map((e) => Question.fromJson(e))
          .toList();

      // Filter by subtopicId
      final filtered = parsedQuestions
          .where((q) => q.subTopicId == subtopicId)
          .toList();

      if (filtered.isEmpty) {
        showCustomToasts(msg: "No questions for this subtopic");
        return;
      }

      emit(filtered);
    } catch (e) {
      showCustomToasts(msg: "Error loading subtopic questions: $e");
    }
  }
}
