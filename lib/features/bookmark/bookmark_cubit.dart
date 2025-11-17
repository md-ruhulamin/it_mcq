import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:it_mcq/core/model/question.dart';

class BookmarkCubit extends Cubit<List<Question>> {
  final Box<Question> box;

  BookmarkCubit(this.box) : super(box.values.toList());

  void toggleBookmark(Question question) {
    final existingIndex = box.values.toList().indexWhere((q) => q.id == question.id);
    if (existingIndex != -1) {
      box.deleteAt(existingIndex);
    } else {
      box.add(question);
    }
    emit(box.values.toList());
  }

  bool isBookmarked(String questionId) {
    return box.values.any((q) => q.id == questionId);
  }
}
