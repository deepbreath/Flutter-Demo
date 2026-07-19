import '../models/study_task.dart';

abstract interface class TaskRepository {
  Future<List<StudyTask>> readAll();

  Future<void> saveAll(List<StudyTask> tasks);
}

class MemoryTaskRepository implements TaskRepository {
  List<StudyTask> _tasks = const [
    StudyTask(id: 1, title: '阅读本节代码'),
    StudyTask(id: 2, title: '独立重写任务清单'),
  ];

  @override
  Future<List<StudyTask>> readAll() async => List.unmodifiable(_tasks);

  @override
  Future<void> saveAll(List<StudyTask> tasks) async {
    _tasks = List.of(tasks);
  }
}
