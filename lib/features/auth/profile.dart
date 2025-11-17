import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_mcq/core/theme/theme_extension.dart';
import 'package:it_mcq/features/bookmark/bookmark_screen.dart';
import 'package:it_mcq/features/quiz/custom_text.dart';
import 'package:it_mcq/features/result/screen/exam_result_list.dart';
import 'package:it_mcq/main.dart';
import 'package:it_mcq/utility/widgets/theme_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Purple Background
            dailyQuizCard(context),

            // Info Cards
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                children: [
                  // Personal Info Card
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? const Color(0xFF2A2A2A).withOpacity(0.9)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        InfoCard(
                          icon: Icons.email,

                          title: 'Email',
                          subtitle: 'ruhulamin@gmail.com',
                        ),
                        Divider(height: 30),

                        InfoCard(
                          icon: Icons.phone,
                          title: 'Phone',
                          subtitle: '+1 234 567 8900',
                        ),
                        Divider(height: 30),
                        InfoCard(
                          icon: Icons.location_on,
                          title: 'Location',
                          subtitle: 'New York, USA',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.deepPurple,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Share',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Settings Options
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? const Color(0xFF2A2A2A).withOpacity(0.9)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Notifications',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookmarkScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.bookmark, color: Colors.blue),
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Bookmarks',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ExamResultListPage(userId: "user_123"),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.security,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  'Result',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.help, color: Colors.orange),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                'Help & Support',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.logout, color: Colors.red),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dailyQuizCard(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        //  color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade300,
        //     blurRadius: 10,
        //     offset: const Offset(0, 4),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blueAccent, width: 3),
              image: const DecorationImage(
                image: NetworkImage('https://i.pravatar.cc/300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Name
          ThemedText(
            'John Doe',
            secondary: false,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),

          // Email
          const ThemedText('john.doe@example.com', secondary: true),

          const SizedBox(height: 5),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _statItem('125', 'Quizzes'),
              _statItem('4', 'Topics'),
              _statItem('365', 'Days'),
            ],
          ),

          const SizedBox(height: 10),

          // Action Button
          ElevatedButton.icon(
            onPressed: () {
              // AppNavigator.goToQuizStart(context, 'daily_quiz');
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text("Start Quiz"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        ThemedText(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        ThemedText(label, secondary: true),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemedText(
              title,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
