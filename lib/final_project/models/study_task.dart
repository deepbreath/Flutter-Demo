import 'package:flutter/foundation.dart';

@immutable
class StudyTask {
  const StudyTask({
    required this.id,
    required this.title,
    this.completed = false,
  });

  final int id;
  final String title;
  final bool completed;

  StudyTask copyWith({String? title, bool? completed}) => StudyTask(
    id: id,
    title: title ?? this.title,
    completed: completed ?? this.completed,
  );
}
