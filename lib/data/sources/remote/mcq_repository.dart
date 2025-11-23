import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/data/sources/remote/github_api_services.dart';
import 'package:it_mcq/dio_client/failure.dart';

class MCQRepository {
  final GithubApiService githubApi;

  MCQRepository(this.githubApi);

  Future<List<Question>> getMCQsForSubtopic({
    required String fileUrl,
    required String subtopicId,
  }) async {
    try {
      final raw = await githubApi.loadRawFile(fileUrl);

      final List<dynamic> decoded = jsonDecode(raw);

      final all = decoded.map((e) => Question.fromJson(e)).toList();

      final filtered = all.where((q) => q.subTopicId == subtopicId).toList();

      if (filtered.isEmpty) {
        throw Failure("No MCQs found for this subtopic");
      }

      return filtered;
    } catch (e) {
      if (e is Failure) rethrow;
      throw Failure("Processing error");
    }
  }
}
abstract class SubtopicMCQState {}

class SubtopicMCQInitial extends SubtopicMCQState {}

class SubtopicMCQLoading extends SubtopicMCQState {}

class SubtopicMCQLoaded extends SubtopicMCQState {
  final List<Question> questions;
  SubtopicMCQLoaded(this.questions);
}

class SubtopicMCQError extends SubtopicMCQState {
  final String message;
  SubtopicMCQError(this.message);
}

class SubtopicMCQCubit extends Cubit<SubtopicMCQState> {
  final MCQRepository repository;

  SubtopicMCQCubit(this.repository) : super(SubtopicMCQInitial());

  Future<void> loadMCQs(String fileUrl, String subtopicId) async {
    emit(SubtopicMCQLoading());

    try {
      final data = await repository.getMCQsForSubtopic(
        fileUrl: fileUrl,
        subtopicId: subtopicId,
      );

      emit(SubtopicMCQLoaded(data));
    } catch (e) {
      final error = e is Failure ? e.message : "Unknown error";
      emit(SubtopicMCQError(error));
    }
  }
}
class SubtopicMCQScreen extends StatelessWidget {
  final String subtopicId;
  final String fileUrl;

  const SubtopicMCQScreen({
    super.key,
    required this.subtopicId,
    required this.fileUrl,
  });

  @override
  Widget build(BuildContext context) {
    context.read<SubtopicMCQCubit>().loadMCQs(fileUrl, subtopicId);

    return Scaffold(
      appBar: AppBar(title: Text("MCQ Practice")),
      body: BlocBuilder<SubtopicMCQCubit, SubtopicMCQState>(
        builder: (context, state) {
          if (state is SubtopicMCQLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SubtopicMCQError) {
            return Center(child: Text(state.message));
          }

          if (state is SubtopicMCQLoaded) {
            return ListView.builder(
              itemCount: state.questions.length,
              itemBuilder: (context, index) {
                final q = state.questions[index];
                return ListTile(
                  title: Text(q.question),
                  subtitle: Text("Difficulty: ${q.difficulty}"),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
