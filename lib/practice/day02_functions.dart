import 'package:flutter/material.dart';

void main() {
  runApp(const Day02App());
}

int add(int a, int b) => a + b;

String greet(String name, {String prefix = '你好'}) {
  return '$prefix，$name！';
}

class Day02App extends StatelessWidget {
  const Day02App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Day 02 · 函数')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(greet('Flutter 学习者')),
              const SizedBox(height: 12),
              Text('10 + 20 = ${add(10, 20)}'),
            ],
          ),
        ),
      ),
    );
  }
}
