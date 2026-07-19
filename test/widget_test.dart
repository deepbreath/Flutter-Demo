import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_daily_practice/main.dart';

void main() {
  testWidgets('显示全部练习并能进入第一节', (tester) async {
    await tester.pumpWidget(const PracticeIndexApp());

    expect(find.text('Flutter 循序练习'), findsOneWidget);
    expect(find.text('变量、类型与空安全'), findsOneWidget);
    expect(PracticeIndexPage.practices, hasLength(16));

    await tester.tap(find.text('变量、类型与空安全'));
    await tester.pumpAndSettle();

    expect(find.text('01 · 变量、类型与空安全'), findsOneWidget);
    expect(find.text('姓名：Flutter 学习者'), findsOneWidget);
  });

  testWidgets('计数器可以增加并重置', (tester) async {
    const page = MaterialApp(home: Day07Harness());
    await tester.pumpWidget(page);

    expect(find.text('点击次数：0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('点击次数：1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(find.text('点击次数：0'), findsOneWidget);
  });
}

class Day07Harness extends StatelessWidget {
  const Day07Harness({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final item = PracticeIndexPage.practices[6];
        return item.builder(context);
      },
    );
  }
}
