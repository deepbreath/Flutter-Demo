import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_daily_practice/main.dart';

void main() {
  testWidgets('显示每日练习章节列表', (tester) async {
    await tester.pumpWidget(const PracticeIndexApp());

    expect(find.text('Flutter 每日练习'), findsOneWidget);
    expect(find.text('Day 01 · 变量与数据类型'), findsOneWidget);
    expect(find.text('Day 05 · StatefulWidget'), findsOneWidget);
  });
}
