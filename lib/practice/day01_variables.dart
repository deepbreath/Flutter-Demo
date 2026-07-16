import 'package:flutter/material.dart';

void main() {
  const name = 'Flutter 学习者';
  const studyDays = 1;
  const progress = 0.2;
  const isCompleted = false;

  runApp(
    PracticeApp(
      title: 'Day 01 · 变量与数据类型',
      lines: [
        '姓名：$name',
        '学习天数：$studyDays',
        '进度：${(progress * 100).toInt()}%',
        '是否完成：$isCompleted',
      ],
    ),
  );
}

class PracticeApp extends StatelessWidget {
  const PracticeApp({required this.title, required this.lines, super.key});

  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: lines
              .map(
                (line) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(line, style: const TextStyle(fontSize: 20)),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
