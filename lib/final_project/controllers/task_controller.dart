import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/study_task.dart';
import '../repositories/task_repository.dart';

enum TaskFilter { all, active, completed }

class TaskController extends ChangeNotifier {
  TaskController(this._repository);

  final TaskRepository _repository;
  final List<StudyTask> _tasks = [];
  bool loading = false;
  Object? error;
  TaskFilter filter = TaskFilter.all;

  UnmodifiableListView<StudyTask> get tasks {
    final filtered = switch (filter) {
      TaskFilter.all => _tasks,
      TaskFilter.active => _tasks.where((task) => !task.completed),
      TaskFilter.completed => _tasks.where((task) => task.completed),
    };
    return UnmodifiableListView(filtered);
  }

  int get completedCount => _tasks.where((task) => task.completed).length;

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      _tasks
        ..clear()
        ..addAll(await _repository.readAll());
    } on Object catch (exception) {
      error = exception;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> add(String title) async {
    final normalized = title.trim();
    if (normalized.isEmpty) return;
    final nextId =
        _tasks.fold(
          0,
          (largest, task) => task.id > largest ? task.id : largest,
        ) +
        1;
    _tasks.add(StudyTask(id: nextId, title: normalized));
    await _saveAndNotify();
  }

  Future<void> toggle(int id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index == -1) return;
    final task = _tasks[index];
    _tasks[index] = task.copyWith(completed: !task.completed);
    await _saveAndNotify();
  }

  Future<void> remove(int id) async {
    _tasks.removeWhere((task) => task.id == id);
    await _saveAndNotify();
  }

  void changeFilter(TaskFilter value) {
    filter = value;
    notifyListeners();
  }

  Future<void> _saveAndNotify() async {
    await _repository.saveAll(_tasks);
    notifyListeners();
  }
}
