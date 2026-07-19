import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day04Page()));

@immutable
class Course {
  const Course({
    required this.title,
    required this.minutes,
    this.completed = false,
  });

  final String title;
  final int minutes;
  final bool completed;

  Course copyWith({String? title, int? minutes, bool? completed}) => Course(
    title: title ?? this.title,
    minutes: minutes ?? this.minutes,
    completed: completed ?? this.completed,
  );
}

class Day04Page extends StatelessWidget {
  const Day04Page({super.key});

  @override
  Widget build(BuildContext context) {
    const course = Course(title: '不可变数据模型', minutes: 25);
    final updated = course.copyWith(completed: true);
    return Scaffold(
      appBar: AppBar(title: const Text('04 · 类与不可变模型')),
      body: Center(
        child: ListTile(
          leading: Icon(
            updated.completed ? Icons.check_circle : Icons.circle_outlined,
          ),
          title: Text(updated.title),
          subtitle: Text(
            '${updated.minutes} 分钟 · ${updated.completed ? '已完成' : '未完成'}',
          ),
        ),
      ),
    );
  }
}
