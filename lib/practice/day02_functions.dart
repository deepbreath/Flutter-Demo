import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day02Page()));

int add(int a, int b) => a + b;

String greet(String name, {String prefix = '你好'}) => '$prefix，$name！';

double average(Iterable<int> values) {
  if (values.isEmpty) return 0;
  return values.reduce(add) / values.length;
}

class Day02Page extends StatelessWidget {
  const Day02Page({super.key});

  @override
  Widget build(BuildContext context) {
    const scores = [80, 92, 88];
    return Scaffold(
      appBar: AppBar(title: const Text('02 · 函数与参数')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(greet('Flutter 学习者')),
            const SizedBox(height: 12),
            Text('10 + 20 = ${add(10, 20)}'),
            Text('平均分：${average(scores).toStringAsFixed(1)}'),
          ],
        ),
      ),
    );
  }
}
