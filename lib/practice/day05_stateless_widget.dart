import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day05Page()));

class Day05Page extends StatelessWidget {
  const Day05Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('05 · StatelessWidget')),
      body: const Center(
        child: ProfileCard(name: 'Flutter 学习者', lesson: '自定义 Widget'),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({required this.name, required this.lesson, super.key});

  final String name;
  final String lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.school, size: 48),
            const SizedBox(height: 12),
            Text(name, style: Theme.of(context).textTheme.titleLarge),
            Text('正在练习：$lesson'),
          ],
        ),
      ),
    );
  }
}
