import 'package:flutter/material.dart';

import 'practice/day01_variables.dart';
import 'practice/day02_functions.dart';
import 'practice/day03_collections.dart';
import 'practice/day04_classes.dart';
import 'practice/day05_stateless_widget.dart';
import 'practice/day06_layout.dart';
import 'practice/day07_stateful_widget.dart';
import 'practice/day08_form.dart';
import 'practice/day09_lists.dart';
import 'practice/day10_navigation.dart';
import 'practice/day11_async.dart';
import 'practice/day12_state_management.dart';
import 'practice/day13_animation.dart';
import 'practice/day14_responsive_theme.dart';
import 'practice/day15_architecture.dart';
import 'practice/day16_final_project.dart';

void main() => runApp(const PracticeIndexApp());

class PracticeIndexApp extends StatelessWidget {
  const PracticeIndexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 循序练习',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PracticeIndexPage(),
    );
  }
}

class PracticeIndexPage extends StatelessWidget {
  const PracticeIndexPage({super.key});

  static final practices = <PracticeItem>[
    PracticeItem('01', '变量、类型与空安全', '认识 Dart 的基本数据', (_) => const Day01Page()),
    PracticeItem('02', '函数与参数', '拆分可复用逻辑', (_) => const Day02Page()),
    PracticeItem(
      '03',
      '集合与流程控制',
      '操作 List、Set 和 Map',
      (_) => const Day03Page(),
    ),
    PracticeItem('04', '类与不可变模型', '用对象表达业务数据', (_) => const Day04Page()),
    PracticeItem('05', 'StatelessWidget', '从小组件组合界面', (_) => const Day05Page()),
    PracticeItem(
      '06',
      '布局与约束',
      '理解 Row、Column、Expanded',
      (_) => const Day06Page(),
    ),
    PracticeItem('07', 'StatefulWidget', '管理局部可变状态', (_) => const Day07Page()),
    PracticeItem('08', '表单与校验', '安全读取并验证输入', (_) => const Day08Page()),
    PracticeItem('09', '动态列表', '增删数据与稳定 Key', (_) => const Day09Page()),
    PracticeItem('10', '页面导航', '传参并接收返回结果', (_) => const Day10Page()),
    PracticeItem('11', '异步、加载与错误', '处理 Future 的完整状态', (_) => const Day11Page()),
    PracticeItem(
      '12',
      '状态提升',
      '用 ValueNotifier 分离状态',
      (_) => const Day12Page(),
    ),
    PracticeItem('13', '动画', '创建有意义的界面过渡', (_) => const Day13Page()),
    PracticeItem('14', '响应式与主题', '适配宽屏和明暗模式', (_) => const Day14Page()),
    PracticeItem('15', '分层架构', '模型、仓库、控制器分工', (_) => const Day15Page()),
    PracticeItem('16', '综合项目：任务清单', '把前面知识串成完整功能', (_) => const Day16Page()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 循序练习')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: practices.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final practice = practices[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: ListTile(
              leading: CircleAvatar(child: Text(practice.number)),
              title: Text(practice.title),
              subtitle: Text(practice.summary),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute<void>(builder: practice.builder)),
            ),
          );
        },
      ),
    );
  }
}

class PracticeItem {
  const PracticeItem(this.number, this.title, this.summary, this.builder);

  final String number;
  final String title;
  final String summary;
  final WidgetBuilder builder;
}
