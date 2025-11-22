import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/router/app_navigator.dart';
import 'package:it_mcq/core/theme/theme_extension.dart';
import 'package:it_mcq/data/topics_maping.dart';
import 'package:it_mcq/features/subtopics/cubit/sub_topic_state.dart';
import 'package:it_mcq/features/subtopics/cubit/sub_topics_cubit.dart';
import 'package:it_mcq/features/subtopics/sub_topics_mcq_screen.dart';
import 'package:it_mcq/utility/widgets/theme_text.dart';

class SubTopicsPage extends StatelessWidget {
  String topicsId;
  SubTopicsPage({super.key, required this.topicsId});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => SubTopicCubit()..loadSubTopics(topicId: topicsId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            topicsMap[topicsId]!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: BlocBuilder<SubTopicCubit, SubTopicState>(
          builder: (context, state) {
            if (state is SubTopicLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SubTopicLoaded) {
              final subtopics = state.subtopics;
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: subtopics.length,
                itemBuilder: (context, index) {
                  final sub = subtopics[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.topic_outlined,
                                color: Colors.blue[700],
                                size: 24,
                              ),
                            ),
                            title: Text(
                              sub.name ?? '',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.3,
                                  ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                sub.description ?? '',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                      height: 1.4,
                                    ),
                              ),
                            ),
                            children: [
                              ...sub.concepts!.map(
                                (c) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[400],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          c,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(height: 1.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Colors.grey[800]
                                      : Colors.grey[100],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.lightbulb_outline,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "${sub.concepts!.length} Concepts",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[700],
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryTile(
                              title: "Practice MCQ",
                              icon: Icons.book,

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubtopicMCQScreen(
                                      subtopicId: sub.id!,
                                    ),
                                  ),
                                );
                                // AppNavigator.goToQuizPractice(
                                //   context,
                                //   topicsId: topicsId,
                                // );
                              },
                            ),
                            const SizedBox(width: 10),
                            CategoryTile(
                              title: "Live Exam",
                              icon: Icons.live_tv,
                              onTap: () {
                                AppNavigator.goToLiveQuiz(
                                  context,
                                  topicsId: topicsId,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is SubTopicError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.message,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;
  const CategoryTile({
    required this.icon,
    this.color = Colors.white,
    required this.title,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
          color: context.isDark ? const Color(0xFF2A2A2A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: context.isDark ? Colors.white : Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.indigo, size: 15),
            ),
            const SizedBox(width: 8),
            ThemedText(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
