import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day09Page()));

class Day09Page extends StatefulWidget {
  const Day09Page({super.key});

  @override
  State<Day09Page> createState() => _Day09PageState();
}

class _Day09PageState extends State<Day09Page> {
  final _topics = <String>['布局', '表单', '列表'];
  int _nextNumber = 1;

  void _add() => setState(() => _topics.add('新练习 ${_nextNumber++}'));

  void _remove(String topic) => setState(() => _topics.remove(topic));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('09 · 动态列表')),
      body: _topics.isEmpty
          ? const Center(child: Text('暂无练习，点击 + 添加'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _topics.length,
              itemBuilder: (_, index) {
                final topic = _topics[index];
                return Dismissible(
                  key: ValueKey(topic),
                  background: const ColoredBox(color: Colors.redAccent),
                  onDismissed: (_) => _remove(topic),
                  child: Card(
                    child: ListTile(
                      title: Text(topic),
                      subtitle: const Text('左滑或右滑删除'),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        child: const Icon(Icons.add),
      ),
    );
  }
}
