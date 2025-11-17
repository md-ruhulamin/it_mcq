// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:it_mcq/core/theme/theme_cubit.dart';
import 'package:it_mcq/core/theme/theme_extension.dart';
import 'package:it_mcq/features/auth/profile.dart';
import 'package:it_mcq/features/home/home_page.dart';
import 'package:it_mcq/features/quiz/quiz_list_screen.dart';
import 'package:it_mcq/features/topics/topics_list.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final pages = [
    const HomePage(),
    QuizListScreen(),
    const TopicListScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            automaticallyImplyLeading:
                false, // This removes the auto back button
            elevation: 0,
            title: Row(
              children: [
                const Icon(Icons.menu, color: Colors.grey),
                const SizedBox(width: 8),
                const Icon(Icons.school, color: Colors.orange, size: 28),
                const SizedBox(width: 4),
                const Text(
                  "Skill Stack ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.read<ThemeCubit>().toggleTheme(),
                  child: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                    color: isDark ? Colors.amber : Colors.black54,
                  ),
                ),
                const SizedBox(width: 10),
                Stack(
                  children: [
                    const Icon(Icons.notifications_none, size: 26),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '6',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

  

          body: pages[state.currentIndex],
          bottomNavigationBar: _FloatingPillNav(
            currentIndex: state.currentIndex,
            onItemSelected: (index) {
              context.read<NavigationCubit>().setIndex(index);
            },
          ),
        );
      },
    );
  }
}

class _FloatingPillNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const _FloatingPillNav({
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? Colors.grey.shade900
              : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: onItemSelected,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text("Home"),
                selectedColor:context.isDark? Colors.white: const Color(0xFF6C21E8),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.play_circle_outline),
                title: const Text("Exam"),
                selectedColor:context.isDark? Colors.white: const Color(0xFF6C21E8),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.history),
                title: const Text("Previous"),
                selectedColor:context.isDark? Colors.white: const Color(0xFF6C21E8),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person_outline),
                title: const Text("Profile"),
                selectedColor:context.isDark? Colors.white: const Color(0xFF6C21E8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationState {
  final int currentIndex;
  final int previousIndex;

  const NavigationState({
    required this.currentIndex,
    required this.previousIndex,
  });

  NavigationState copyWith({int? currentIndex, int? previousIndex}) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      previousIndex: previousIndex ?? this.previousIndex,
    );
  }
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
    : super(const NavigationState(currentIndex: 0, previousIndex: 0));

  void setIndex(int index) {
    print("Navigation changed to index: $index");
    if (index == state.currentIndex) return;
    emit(
      NavigationState(currentIndex: index, previousIndex: state.currentIndex),
    );
  }
}
