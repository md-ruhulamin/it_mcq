// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 0;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      id: fields[0] as String,
      quizId: fields[1] as String,
      topicId: fields[2] as String,
      subTopicId: fields[3] as String?,
      question: fields[4] as String,
      options: (fields[5] as List).cast<String>(),
      correctIndex: fields[6] as int,
      explanation: fields[7] as String,
      difficulty: fields[8] as String,
      isActive: fields[9] as bool,
      tags: (fields[10] as List?)?.cast<String>(),
      reference: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.quizId)
      ..writeByte(2)
      ..write(obj.topicId)
      ..writeByte(3)
      ..write(obj.subTopicId)
      ..writeByte(4)
      ..write(obj.question)
      ..writeByte(5)
      ..write(obj.options)
      ..writeByte(6)
      ..write(obj.correctIndex)
      ..writeByte(7)
      ..write(obj.explanation)
      ..writeByte(8)
      ..write(obj.difficulty)
      ..writeByte(9)
      ..write(obj.isActive)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.reference);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
