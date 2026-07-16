import 'package:flutter/material.dart';

void main() {
  runApp(const PracticeIndexApp());
}

class PracticeIndexApp extends StatelessWidget {
  const PracticeIndexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 每日练习',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PracticeIndexPage(),
    );
  }
}

class PracticeIndexPage extends StatelessWidget {
  const PracticeIndexPage({super.key});

  static const practices = <({String day, String title, String target})>[
    (day: 'Day 01', title: '变量与数据类型', target: 'day01_variables.dart'),
    (day: 'Day 02', title: '函数', target: 'day02_functions.dart'),
    (day: 'Day 03', title: '类与对象', target: 'day03_classes.dart'),
    (day: 'Day 04', title: 'StatelessWidget', target: 'day04_widget.dart'),
    (
      day: 'Day 05',
      title: 'StatefulWidget',
      target: 'day05_stateful_widget.dart',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 每日练习')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: practices.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final practice = practices[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('${practice.day} · ${practice.title}'),
              subtitle: SelectableText(
                'flutter run -t lib/practice/${practice.target}',
              ),
            ),
          );
        },
      ),
    );
  }
}
