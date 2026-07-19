import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day13Page()));

class Day13Page extends StatefulWidget {
  const Day13Page({super.key});

  @override
  State<Day13Page> createState() => _Day13PageState();
}

class _Day13PageState extends State<Day13Page> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('13 · 隐式动画')),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            width: _expanded ? 260 : 160,
            height: _expanded ? 180 : 100,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _expanded
                  ? colors.primaryContainer
                  : colors.secondaryContainer,
              borderRadius: BorderRadius.circular(_expanded ? 32 : 12),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 350),
              alignment: _expanded ? Alignment.bottomRight : Alignment.center,
              child: Text(_expanded ? '再次点击收起' : '点击展开'),
            ),
          ),
        ),
      ),
    );
  }
}
