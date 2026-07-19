import 'package:flutter/material.dart';

import '../final_project/controllers/task_controller.dart';
import '../final_project/repositories/task_repository.dart';
import '../final_project/views/task_page.dart';

void main() => runApp(const Day16App());

class Day16App extends StatelessWidget {
  const Day16App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const Day16Page(),
    );
  }
}

class Day16Page extends StatefulWidget {
  const Day16Page({super.key});

  @override
  State<Day16Page> createState() => _Day16PageState();
}

class _Day16PageState extends State<Day16Page> {
  late final TaskController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TaskController(MemoryTaskRepository())..load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TaskPage(controller: _controller);
}
