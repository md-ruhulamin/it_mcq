import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/router/app_navigator.dart';
import '../../../core/theme/theme_cubit.dart';

class QuizListScreen extends StatelessWidget {
  const QuizListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy JSON-like data
    final quizzes = [
      {
        "title": "ডেইলি কুইজ",
        "subject": "IT & Computer Science",
        "topics":
            "Programming (Python/Java/JavaScript), Data Structures, Algorithms, Databases (SQL/NoSQL), Web Technologies",
        "marks": 25,
        "duration": "10 min",
        "studyMaterials": 5,
      },
      {
        "title": "প্রাইমারি ডেইলি কুইজ",
        "subject": "IT Fundamentals",
        "topics":
            "Operating Systems, Networking Basics, Cybersecurity Essentials, Version Control (Git), Cloud Basics",
        "marks": 20,
        "duration": "10 min",
        "studyMaterials": 8,
      },
      {
        "title": "D নিয়োগ প্রস্তুতি — লং কোর্স",
        "subject": "IT & Computer Science",
        "topics":
            "IT Recruitment Prep: Programming Concepts, Data Structures & Algorithms, DB Systems, Networking & Security, Software Testing",
        "marks": 25,
        "duration": "27 min",
        "studyMaterials": 10,
      },
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          final quiz = quizzes[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      quiz["title"].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "OMR",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Total marks: ${quiz["marks"]}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  "Duration: ${quiz["duration"]}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  "Subject - ${quiz["subject"]}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "Topics: ${quiz["topics"]}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Study materials
                Row(
                  children: [
                    const Icon(
                      Icons.menu_book_rounded,
                      color: Colors.orange,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Study materials (${quiz["studyMaterials"]})",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          AppNavigator.goToQuizPractice(context,topicsId: 't001');
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                        ),
                        child: const Text("প্র্যাকটিস কুইজ"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size.fromHeight(40),
                        ),
                        child: const Text("লাইভ পরীক্ষা দিন"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

      // Bottom Navigation
    );
  }
}
