import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day07Page()));

class Day07Page extends StatefulWidget {
  const Day07Page({super.key});

  @override
  State<Day07Page> createState() => _Day07PageState();
}

class _Day07PageState extends State<Day07Page> {
  int _count = 0;

  void _increment() => setState(() => _count++);

  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('07 · StatefulWidget'),
        actions: [
          IconButton(
            onPressed: _reset,
            icon: const Icon(Icons.refresh),
            tooltip: '重置',
          ),
        ],
      ),
      body: Center(
        child: Semantics(
          liveRegion: true,
          child: Text(
            '点击次数：$_count',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: '增加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
