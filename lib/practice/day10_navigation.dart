import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day10Page()));

class Day10Page extends StatefulWidget {
  const Day10Page({super.key});

  @override
  State<Day10Page> createState() => _Day10PageState();
}

class _Day10PageState extends State<Day10Page> {
  String _result = '尚未选择';

  Future<void> _chooseTopic() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute<String>(builder: (_) => const _TopicPickerPage()),
    );
    if (!mounted || result == null) return;
    setState(() => _result = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('10 · 页面导航')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('已选择：$_result'),
            const SizedBox(height: 16),
            FilledButton(onPressed: _chooseTopic, child: const Text('选择学习主题')),
          ],
        ),
      ),
    );
  }
}

class _TopicPickerPage extends StatelessWidget {
  const _TopicPickerPage();

  @override
  Widget build(BuildContext context) {
    const topics = ['动画', '网络请求', '状态管理'];
    return Scaffold(
      appBar: AppBar(title: const Text('选择主题')),
      body: ListView(
        children: [
          for (final topic in topics)
            ListTile(
              title: Text(topic),
              onTap: () => Navigator.of(context).pop(topic),
            ),
        ],
      ),
    );
  }
}
