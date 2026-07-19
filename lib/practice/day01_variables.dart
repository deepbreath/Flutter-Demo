import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day01Page()));

String displayTopic(String? topic) => topic ?? '待定';

String completionLabel(bool completed) => completed ? '是' : '否';

class Day01Page extends StatelessWidget {
  const Day01Page({super.key});

  @override
  Widget build(BuildContext context) {
    const learner = 'Flutter 学习者';
    const studyDays = 1;
    const progress = 0.2;
    const isCompleted = false;
    const String? nextTopic = null;

    final values = <String>[
      '姓名：$learner',
      '学习天数：$studyDays',
      '进度：${(progress * 100).round()}%',
      '是否完成：${completionLabel(isCompleted)}',
      '下一主题：${displayTopic(nextTopic)}',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('01 · 变量、类型与空安全')),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: values.length,
        separatorBuilder: (_, _) => const Divider(),
        itemBuilder: (_, index) =>
            Text(values[index], style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
