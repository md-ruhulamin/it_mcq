import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/component/custome_btn.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/data/topics_maping.dart';
import 'package:it_mcq/features/bookmark/bookmark_cubit.dart';
import 'package:it_mcq/features/quiz/bloc/question_cubit.dart';
import 'package:it_mcq/features/quiz/custom_text.dart';
import 'package:it_mcq/features/quiz/quiz_result.dart';
import 'package:it_mcq/utility/widgets/theme_text.dart';

class QuizPracticeScreen extends StatefulWidget {
  String topicId;
  QuizPracticeScreen({super.key, required this.topicId});

  @override
  State<QuizPracticeScreen> createState() => _QuizPracticeScreenState();
}

class _QuizPracticeScreenState extends State<QuizPracticeScreen> {
  // Track user's selected answers for each question
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
    return BlocProvider(
      create: (context) =>
          QuestionCubit()..loadQuestions(topicsId: widget.topicId),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

          title: Text(
            topicsMap[widget.topicId]!,
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
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
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
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
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
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    final bool isAnswered = widget.selectedAnswer != null;
    final bool isCorrect =
        isAnswered && widget.selectedAnswer == widget.question.correctIndex;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.showAnswer
              ? (isCorrect ? Colors.green.shade200 : Colors.red.shade200)
              : Colors.grey.shade200,
          width: widget.showAnswer ? 2 : 1,
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
              color: widget.showAnswer
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
                    color: widget.showAnswer
                        ? (isCorrect ? Colors.green : Colors.red)
                        : Colors.blue.shade600,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${widget.questionNumber}',
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
                    widget.question.question,
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
                widget.question.options.length,
                (index) => _buildOption(context, index),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: widget.showAnswer
                          ? widget.onHideAnswer
                          : widget.onShowAnswer,
                      icon: Icon(
                        widget.showAnswer
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 18,
                      ),
                      label: Text(
                        widget.showAnswer ? 'Hide Answer' : 'Show Answer',
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        side: BorderSide(
                          color: widget.showAnswer
                              ? Colors.orange.shade300
                              : Colors.blue.shade300,
                        ),
                        backgroundColor: widget.showAnswer
                            ? Colors.orange.shade50
                            : Colors.blue.shade50,
                        foregroundColor: widget.showAnswer
                            ? Colors.orange.shade700
                            : Colors.blue.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                BlocBuilder<BookmarkCubit, List<Question>>(
                  builder: (context, bookmarks) {
                    final isBookmarked = bookmarks.any(
                      (q) => q.id == widget.question.id,
                    );

                    return OutlinedButton(
                      child: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      ),
                      onPressed: () {
                        context.read<BookmarkCubit>().toggleBookmark(
                          widget.question,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          // Explanation (shown when Show Answer is clicked)
          if (widget.showAnswer)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.amber.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Explanation',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.question.explanation,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.amber.shade900,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (widget.question.tags!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.question.tags!.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue.shade200),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green.shade700,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Answer: ${widget.question.options[widget.question.correctIndex!]}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, int index) {
    final bool isSelected = widget.selectedAnswer == index;
    final bool isCorrectOption = index == widget.question.correctIndex;
    final bool showCorrect = widget.showAnswer && isCorrectOption;
    final bool showWrong = widget.showAnswer && isSelected && !isCorrectOption;

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
        onTap: () => widget.onAnswerSelected(index),
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
                  widget.question.options[index],
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
