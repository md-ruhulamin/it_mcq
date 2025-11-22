import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/core/router/routes.dart';
import 'package:it_mcq/data/repo/notification_api.dart';
import 'package:it_mcq/features/auth/auth_gate/auth_gate_cubit.dart';
import 'package:it_mcq/features/auth/bloc/login_cubit.dart';
import 'package:it_mcq/features/auth/user_gate.dart';
import 'package:it_mcq/features/bookmark/bookmark_cubit.dart';
import 'package:it_mcq/features/home/dash_board.dart';
import 'package:it_mcq/features/quiz/bloc/question_cubit.dart';
import 'package:it_mcq/features/result/cubit/exam_cubit.dart';
import 'package:it_mcq/features/subtopics/sub_topics_mcq_screen.dart';
import 'package:it_mcq/features/topics/bloc/topic_cubit.dart';
import 'package:it_mcq/firebase_options.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FCMService.getDeviceToken();
  await Hive.initFlutter();

  Hive.registerAdapter(QuestionAdapter());
  final box = await Hive.openBox<Question>('bookmarked_questions');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => AuthenticationCubit()),
        BlocProvider(create: (_) => ExamResultCubit()),
        BlocProvider(create: (_) => AuthGateCubit()),
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => QuestionCubit()),
        BlocProvider(create: (_) => BookmarkCubit(box)),
        BlocProvider(create: (_) => TopicCubit()..loadTopics()),
        BlocProvider(create: (_) => SubtopicsMCQCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Safe to initialize notifications here
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationController.initialize(navigatorKey.currentContext!);
    });

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'IT Exam App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          home: const AuthGate(),
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
