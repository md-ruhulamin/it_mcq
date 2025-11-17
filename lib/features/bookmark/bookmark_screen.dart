import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/features/bookmark/bookmark_cubit.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  // Local states for answers and visibility
  Map<String, int?> userAnswers = {};
  Map<String, bool> showAnswers = {};
  bool showAnswerAll = false;

  int _getAnsweredCount() {
    return userAnswers.values.where((answer) => answer != null).length;
  }

  void _resetQuiz() {
    setState(() {
      userAnswers.clear();
      showAnswers.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bookmark reset successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Bookmarked Questions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<BookmarkCubit, List<Question>>(
        builder: (context, bookmarks) {
          if (bookmarks.isEmpty) {
            return const Center(
              child: Text(
                "No bookmarked questions yet!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return Column(
            children: [
              // Info Banner
              Container(
                width: double.infinity,
                color: Colors.yellow.shade50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      color: Colors.orange.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'These are your bookmarked questions. You can practice and unbookmark anytime.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.orange.shade900,
                        ),
                      ),
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
                            '${_getAnsweredCount()}/${bookmarks.length}',
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

              // Bookmarked Questions List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: bookmarks.length,
                  itemBuilder: (context, index) {
                    final question = bookmarks[index];

                    return QuestionCard(
                      questionNumber: index + 1,
                      question: question,
                      selectedAnswer: userAnswers[question.id],
                      showAnswer: showAnswers[question.id] ?? false,
                      onAnswerSelected: (optionIndex) {
                        setState(() {
                          userAnswers[question.id] = optionIndex;
                        });
                      },
                      onShowAnswer: () {
                        setState(() {
                          showAnswers[question.id] = true;
                        });
                      },
                      onHideAnswer: () {
                        setState(() {
                          showAnswers[question.id] = false;
                        });
                      },
                    );
                  },
                ),
              ),

              // Bottom Action Bar
              Container(
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
                      child: OutlinedButton.icon(
                        onPressed: _resetQuiz,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset All'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (showAnswerAll) {
                            setState(() {
                              showAnswerAll = false;
                              showAnswers.updateAll((key, value) => false);
                            });
                          } else {
                            setState(() {
                              showAnswerAll = true;
                              for (var q in bookmarks) {
                                showAnswers[q.id] = true;
                              }
                            });
                          }
                        },
                        icon: const Icon(Icons.visibility),
                        label: Text(
                          showAnswerAll
                              ? 'Hide All Answers'
                              : 'Show All Answers',
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.blue.shade600,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
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
          // Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          title: const Row(
                            children: [
                              Icon(Icons.lightbulb_outline, color: Colors.blue),
                              SizedBox(width: 8),
                              Text("Explanation"),
                            ],
                          ),
                          content: Text(
                            question.explanation,
                            style: const TextStyle(height: 1.5),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.info_outline, size: 18),
                    label: const Text("Explanation"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      side: BorderSide(color: Colors.blue.shade300),
                      //   backgroundColor: Colors.blue.shade50,
                      foregroundColor: Colors.blue.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          title: const Row(
                            children: [
                              Icon(Icons.label, color: Colors.blue),
                              SizedBox(width: 8),
                              Text("Tags"),
                            ],
                          ),
                          content: Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: question.tags!.map((tag) {
                              return Container(
                                decoration: BoxDecoration(
                                  //     color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  child: Text(
                                    tag,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        255,
                                        13,
                                        43,
                                        73,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.label, size: 18),
                    label: const Text("Tags"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      side: BorderSide(color: Colors.blue.shade300),
                      backgroundColor: Colors.blue.shade50,
                      foregroundColor: Colors.blue.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                BlocBuilder<BookmarkCubit, List<Question>>(
                  builder: (context, bookmarks) {
                    final isBookmarked = bookmarks.any(
                      (q) => q.id == question.id,
                    );

                    return IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      ),
                      onPressed: () {
                        context.read<BookmarkCubit>().toggleBookmark(question);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
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
