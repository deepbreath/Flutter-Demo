import 'package:flutter/material.dart';

void main() {
  final student = Student(name: '小明', completedLessons: 3);
  runApp(Day03App(student: student));
}

class Student {
  const Student({required this.name, required this.completedLessons});

  final String name;
  final int completedLessons;

  String summary() => '$name 已完成 $completedLessons 个章节';
}

class Day03App extends StatelessWidget {
  const Day03App({required this.student, super.key});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Day 03 · 类与对象')),
        body: Center(
          child: Text(student.summary(), style: const TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
