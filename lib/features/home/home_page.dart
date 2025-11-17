import 'package:flutter/material.dart';
import 'package:it_mcq/core/router/app_navigator.dart';

import 'package:it_mcq/core/theme/theme_extension.dart';
import 'package:it_mcq/data/topics_maping.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=12',
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Ruhul',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: context.isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ready to study?',
                      style: TextStyle(
                        color: context.isDark ? Colors.white.withOpacity(0.7) : Colors.black87.withOpacity(0.7) ,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Sample horizontal cards
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  return Container(
                    width: 260,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.indigo.shade400.withOpacity(0.9),
                          Colors.indigo.shade700,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Practice streak',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '7 days',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 18),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),

            // Static categories grid — placeholders per your selection
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 5,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 3.4,
              shrinkWrap: true,
              children: List.generate(8, (index) {
                final icons = [
                  Icons.data_array,
                  Icons.data_exploration,
                  Icons.code,
                  Icons.storage,
                  Icons.memory,
                  Icons.router,
                  Icons.cloud_queue,
                  Icons.security,
                ];
                final titles = [
                  't001',
                  't002',
                  't003',
                  't004',
                  't005',
                  't006',
                  't007',
                  't007',
                ];
                return CategoryTile(
                  onTap: () {
                    print(titles[index]);
                    AppNavigator.goToSubtopics(
                      context,
                      topicsId: titles[index],
                    );
                  },
                  icon: icons[index],
                  title: titles[index],
                );
              }),
            ),

            const SizedBox(height: 18),
            const Text(
              'Recent Exams',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),

            // List of recent exams
            Column(
              children: List.generate(3, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? const Color(0xFF2A2A2A).withOpacity(0.9)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(child: Text('${i + 1}')),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DSA Mock Test ${i + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: context.isDark
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Score: 72 • 30 Qs',
                                style: TextStyle(
                                  color: context.isDark
                                      ? Colors.white.withOpacity(0.7)
                                      : Colors.black87.withOpacity(0.7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CategoryTile({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: context.isDark
              ? const Color(0xFF2A2A2A).withOpacity(0.9)
              : Colors.white,
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
              child: Icon(icon, color: Colors.indigo, size: 20),
            ),
            const SizedBox(width: 8),
            Text(
              topicsMap[title] ?? "Empty",
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: context.isDark ? Colors.white : Colors.black87,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
