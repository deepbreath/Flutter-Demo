import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day03Page()));

class Day03Page extends StatelessWidget {
  const Day03Page({super.key});

  @override
  Widget build(BuildContext context) {
    const topics = ['Dart', 'Widget', '布局', '状态管理'];
    final completed = {'Dart', 'Widget'};
    final minutes = <String, int>{'Dart': 30, 'Widget': 45};
    final remaining = topics.where((topic) => !completed.contains(topic));

    return Scaffold(
      appBar: AppBar(title: const Text('03 · 集合与流程控制')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final topic in topics)
            CheckboxListTile(
              value: completed.contains(topic),
              onChanged: null,
              title: Text(topic),
              subtitle: Text('学习 ${minutes[topic] ?? 0} 分钟'),
            ),
          const Divider(),
          Text('待学习：${remaining.join('、')}'),
        ],
      ),
    );
  }
}
