import 'package:flutter/material.dart';
import 'package:it_mcq/core/model/question.dart';
class AnswerSheetScreen extends StatefulWidget {
  final List<Question> quizList;
  final Map<int, int?> userAnswers;

  const AnswerSheetScreen({
    super.key,
    required this.quizList,
    required this.userAnswers,
  });

  @override
  State<AnswerSheetScreen> createState() => _AnswerSheetScreenState();
}

class _AnswerSheetScreenState extends State<AnswerSheetScreen> {
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

  int _getCorrectCount() {
    int correct = 0;
    for (int i = 0; i < widget.quizList.length; i++) {
      if (widget.userAnswers[i] == widget.quizList[i].correctIndex) {
        correct++;
      }
    }
    return correct;
  }

  int _getWrongCount() {
    int wrong = 0;
    for (int i = 0; i < widget.quizList.length; i++) {
      final userAns = widget.userAnswers[i];
      if (userAns != null && userAns != widget.quizList[i].correctIndex) {
        wrong++;
      }
    }
    return wrong;
  }

  int _getUnansweredCount() {
    return widget.userAnswers.values.where((ans) => ans == null).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Answer Sheet',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Stats Banner
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatChip(
                  'Correct',
                  _getCorrectCount(),
                  Colors.green.shade600,
                  Icons.check_circle,
                ),
                _buildStatChip(
                  'Wrong',
                  _getWrongCount(),
                  Colors.red.shade600,
                  Icons.cancel,
                ),
                _buildStatChip(
                  'Skipped',
                  _getUnansweredCount(),
                  Colors.grey.shade600,
                  Icons.remove_circle_outline,
                ),
              ],
            ),
          ),

          // Questions List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: widget.quizList.length,
              itemBuilder: (context, index) {
                final question = widget.quizList[index];
                final userAnswerIndex = widget.userAnswers[index];
                final isBookmarked = bookmarkedQuestions.contains(index);
                final isCorrect = userAnswerIndex == question.correctIndex;
                final isUnanswered = userAnswerIndex == null;

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(
                    //   color: isUnanswered
                    //       ? Colors.grey.shade200
                    //       : isCorrect
                    //           ? Colors.green.shade200
                    //           : Colors.red.shade200,
                    //   width: isUnanswered ? 1 : 2,
                    // ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
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
                          color: isUnanswered
                              ? Colors.grey.shade50
                              : isCorrect
                                  ? Colors.green.shade50
                                  : Colors.red.shade50,
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
                                color: isUnanswered
                                    ? Colors.grey.shade600
                                    : isCorrect
                                        ? Colors.green
                                        : Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
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
                            4,
                            (optionIndex) => _buildOption(
                              optionIndex,
                              question.options[optionIndex],
                              question.correctIndex == optionIndex,
                              userAnswerIndex == optionIndex,
                              isUnanswered,
                            ),
                          ),
                        ),
                      ),

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
                                          Icon(Icons.lightbulb_outline,
                                              color: Colors.blue),
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
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Close"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.info_outline, size: 18),
                                label: const Text("Explanation"),
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
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
                                          Icon(Icons.label,
                                              color: Colors.blue),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.blue.shade200),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                              child: Text(
                                                tag,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: const Color.fromARGB(255, 13, 43, 73),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Close"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.label, size: 18),
                                label: const Text("Tags"),
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  side: BorderSide(color: Colors.blue.shade300),
                                  backgroundColor: Colors.blue.shade50,
                                  foregroundColor: Colors.blue.shade700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () => toggleBookmark(index),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                side: BorderSide(
                                  color: isBookmarked
                                      ? Colors.orange.shade300
                                      : Colors.blue.shade300,
                                ),
                                backgroundColor: isBookmarked
                                    ? Colors.orange.shade50
                                    : Colors.blue.shade50,
                                foregroundColor: isBookmarked
                                    ? Colors.orange.shade700
                                    : Colors.blue.shade700,
                              ),
                              child: Icon(
                                isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(String label, int count, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 3),
          Text(
            '$count',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    int index,
    String text,
    bool isCorrect,
    bool isSelected,
    bool isUnanswered,
  ) {
    Color borderColor= Colors.white;;
    Color backgroundColor = Colors.white;;
    Color textColor;
    Widget? trailingIcon;

    if (isCorrect) {
      borderColor = Colors.green;
   //   backgroundColor = Colors.green.shade50;
      textColor = Colors.green.shade900;
      trailingIcon = const Icon(Icons.check_circle, color: Colors.green, size: 20);
    } else if (isSelected) {
     borderColor = Colors.red;
     // backgroundColor = Colors.red.shade50;
      textColor = Colors.red.shade900;
      trailingIcon = const Icon(Icons.cancel, color: Colors.red, size: 20);
    } else {
    borderColor = Colors.grey.shade300;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      trailingIcon = null;
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1.5),
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
              color: isCorrect || isSelected ? borderColor : Colors.transparent,
            ),
            child: Center(
              child: Text(
                String.fromCharCode(65 + index),
                style: TextStyle(
                  color: isCorrect || isSelected ? Colors.black : borderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight:
                    isCorrect || isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            trailingIcon,
          ],
        ],
      ),
    );
  }
}