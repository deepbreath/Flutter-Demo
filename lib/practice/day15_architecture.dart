import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day15Page()));

@immutable
class Lesson {
  const Lesson({required this.id, required this.title});

  final int id;
  final String title;
}

abstract interface class LessonRepository {
  Future<List<Lesson>> getLessons();
}

class MemoryLessonRepository implements LessonRepository {
  @override
  Future<List<Lesson>> getLessons() async => const [
    Lesson(id: 1, title: '模型只保存数据'),
    Lesson(id: 2, title: '仓库负责获取数据'),
    Lesson(id: 3, title: '控制器协调界面状态'),
  ];
}

class LessonController extends ChangeNotifier {
  LessonController(this._repository);

  final LessonRepository _repository;
  List<Lesson> lessons = const [];
  bool loading = false;
  Object? error;

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      lessons = await _repository.getLessons();
    } on Object catch (exception) {
      error = exception;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}

class Day15Page extends StatefulWidget {
  const Day15Page({super.key});

  @override
  State<Day15Page> createState() => _Day15PageState();
}

class _Day15PageState extends State<Day15Page> {
  late final LessonController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LessonController(MemoryLessonRepository())..load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('15 · 分层架构')),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (_, _) {
          if (_controller.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_controller.error != null) {
            return Center(
              child: FilledButton(
                onPressed: _controller.load,
                child: const Text('重试'),
              ),
            );
          }
          return ListView.builder(
            itemCount: _controller.lessons.length,
            itemBuilder: (_, index) {
              final lesson = _controller.lessons[index];
              return ListTile(
                leading: Text('${lesson.id}'),
                title: Text(lesson.title),
              );
            },
          );
        },
      ),
    );
  }
}
