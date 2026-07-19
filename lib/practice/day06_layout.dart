import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day06Page()));

class Day06Page extends StatelessWidget {
  const Day06Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('06 · 布局与约束')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('父组件把约束向下传，子组件把尺寸向上传。'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Expanded(
                    child: _LayoutBlock(label: '1 份', color: Colors.indigo),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: _LayoutBlock(label: '2 份', color: Colors.teal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LayoutBlock extends StatelessWidget {
  const _LayoutBlock({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: color,
    child: Center(
      child: Text(label, style: const TextStyle(color: Colors.white)),
    ),
  );
}
