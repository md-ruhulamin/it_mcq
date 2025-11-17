// exam_result_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:it_mcq/core/model/exam_result.dart';
import 'package:it_mcq/core/model/question.dart';
import 'package:it_mcq/features/result/cubit/exam_result_state.dart';

class ExamResultCubit extends Cubit<ExamResultState> {
  ExamResultCubit() : super(ExamResultInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> loadUserResults(String userId) async {
    emit(ExamResultLoading());
    try {
      final snapshot = await _firestore
          .collection('examResults')
          .where('userId', isEqualTo: userId)
          .get();

      final results = snapshot.docs.map((e) => ExamResult.fromDoc(e)).toList();
      emit(ExamResultLoaded(results));
    } catch (e) {
      emit(ExamResultFailure("Failed to load results: $e"));
    }
  }

  Future<void> uploadExamResult(ExamResult result) async {
    emit(ExamResultLoading());
    try {
      await _firestore.collection('examResults').add(result.toMap());
      emit(ExamResultSuccess("Exam result uploaded successfully!"));
    } catch (e) {
      emit(ExamResultFailure("Failed to upload: $e"));
    }
  }

  Future<void> loadUserSummaries(String userId) async {
    // Prevent redundant loading if already loading
    if (state is ExamResultLoading) return;

    emit(ExamResultLoading());
    try {
      final snapshot = await _firestore
          .collection('examResults')
          .where('userId', isEqualTo: userId)
          .orderBy('submittedAt', descending: true)
          .get();

      // Convert DocumentSnapshot to the lightweight ExamSummary object
      final summaries = snapshot.docs
          .map((e) => ExamSummary.fromDoc(e))
          .toList();

      emit(ExamSummaryLoaded(summaries));
    } catch (e) {
      // Log error for debugging
      print('Firestore error in loadUserSummaries: $e');
      emit(
        ExamResultFailure(
          "Failed to load summaries. Please check your network.",
        ),
      );
    }
  }

  /// --- 2. Load the full details of a single result on click ---
  /// Emits ExamResultLoading -> ExamResultDetailLoaded (or ExamResultFailure)
  Future<void> loadResultDetails(String docId) async {
    // Emit loading state for the specific detail view
    // Note: You might want a separate DetailLoading state for cleaner UI
    // but for simplicity, we'll use the general one.
    emit(ExamResultLoading());
    try {
      final doc = await _firestore.collection('examResults').doc(docId).get();

      if (!doc.exists) {
        emit(ExamResultFailure("Result not found."));
        return;
      }

      // Convert the full DocumentSnapshot to the detailed ExamResult object
      final result = ExamResult.fromDoc(doc);

      emit(ExamResultDetailLoaded(result));
    } catch (e) {
      // Log error for debugging
      print('Firestore error in loadResultDetails: $e');
      emit(ExamResultFailure("Failed to load exam details: $e"));
      // Re-emit the previous summary state if possible to keep the list visible
      // (This requires passing the previous state into the catch block, but is advanced)
    }
  }
}

class ExamSummary {
  final String docId; // The Firestore Document ID
  final String userId;
  final String examId;
  final int score;
  final DateTime submittedAt;

  ExamSummary({
    required this.docId,
    required this.userId,
    required this.examId,
    required this.score,
    required this.submittedAt,
  });

  factory ExamSummary.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ExamSummary(
      docId: doc.id, // Capture the document ID here!
      userId: data['userId'] ?? '',
      examId: data['examId'] ?? '',
      score: data['score'] ?? 0,
      submittedAt: (data['submittedAt'] as Timestamp).toDate(),
    );
  }
}
