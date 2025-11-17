import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:it_mcq/core/model/answer_model.dart';
import 'package:it_mcq/core/model/exam_result.dart';
// exam_result_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:it_mcq/features/result/cubit/exam_cubit.dart';

abstract class ExamResultState {}

class ExamResultInitial extends ExamResultState {}

class ExamResultLoading extends ExamResultState {}

class ExamResultSuccess extends ExamResultState {
  final String message;
  ExamResultSuccess(this.message);
}

class ExamResultLoaded extends ExamResultState {
  final List<ExamResult> results;
  ExamResultLoaded(this.results);
}

class ExamResultFailure extends ExamResultState {
  final String error;
  ExamResultFailure(this.error);
}



class ExamSummaryLoaded extends ExamResultState {
  final List<ExamSummary> summaries; // Requires the lightweight ExamSummary class
  ExamSummaryLoaded(this.summaries);
}

class ExamResultDetailLoaded extends ExamResultState {
  final ExamResult result; // Requires the full ExamResult class
  ExamResultDetailLoaded(this.result);
}
