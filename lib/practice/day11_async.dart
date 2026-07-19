import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Day11Page()));

class QuoteRepository {
  Future<String> fetchQuote() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return '先让功能正确，再让代码清晰。';
  }
}

class Day11Page extends StatefulWidget {
  const Day11Page({super.key});

  @override
  State<Day11Page> createState() => _Day11PageState();
}

class _Day11PageState extends State<Day11Page> {
  final _repository = QuoteRepository();
  late Future<String> _quote;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() => _quote = _repository.fetchQuote();

  void _retry() => setState(_load);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('11 · 异步、加载与错误')),
      body: Center(
        child: FutureBuilder<String>(
          future: _quote,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('加载失败'),
                  TextButton(onPressed: _retry, child: const Text('重试')),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Text(snapshot.data ?? '暂无内容'),
            );
          },
        ),
      ),
    );
  }
}
