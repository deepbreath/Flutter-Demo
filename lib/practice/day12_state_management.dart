import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day12Page()));

class CounterController extends ValueNotifier<int> {
  CounterController() : super(0);

  void increment() => value++;

  void reset() => value = 0;
}

class Day12Page extends StatefulWidget {
  const Day12Page({super.key});

  @override
  State<Day12Page> createState() => _Day12PageState();
}

class _Day12PageState extends State<Day12Page> {
  final _controller = CounterController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('12 · 状态提升'),
        actions: [
          IconButton(
            onPressed: _controller.reset,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: _controller,
          builder: (_, count, _) => Text(
            '控制器中的计数：$count',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
