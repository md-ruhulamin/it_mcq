import 'package:equatable/equatable.dart';
import 'package:it_mcq/core/model/subtopics.dart';
abstract class SubTopicState extends Equatable {
  const SubTopicState();
  @override
  List<Object?> get props => [];
}

class SubTopicInitial extends SubTopicState {}

class SubTopicLoading extends SubTopicState {}

class SubTopicLoaded extends SubTopicState {
  final List<SubTopic> subtopics;
  const SubTopicLoaded(this.subtopics);

  @override
  List<Object?> get props => [subtopics];
}

class SubTopicError extends SubTopicState {
  final String message;
  const SubTopicError(this.message);
  @override
  List<Object?> get props => [message];
}
