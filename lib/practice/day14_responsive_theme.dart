import 'package:flutter/material.dart';

void main() => runApp(const Day14App());

class Day14App extends StatefulWidget {
  const Day14App({super.key});

  @override
  State<Day14App> createState() => _Day14AppState();
}

class _Day14AppState extends State<Day14App> {
  ThemeMode _mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _mode,
      home: Day14Page(
        isDark: _mode == ThemeMode.dark,
        onThemeChanged: (isDark) {
          setState(() => _mode = isDark ? ThemeMode.dark : ThemeMode.light);
        },
      ),
    );
  }
}

class Day14Page extends StatelessWidget {
  const Day14Page({this.isDark = false, this.onThemeChanged, super.key});

  final bool isDark;
  final ValueChanged<bool>? onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('14 · 响应式与主题'),
        actions: [Switch(value: isDark, onChanged: onThemeChanged)],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 600;
          final cards = const [
            _InfoCard(icon: Icons.phone_android, label: '窄屏：单列'),
            _InfoCard(icon: Icons.tablet, label: '宽屏：双列'),
          ];
          return GridView.count(
            padding: const EdgeInsets.all(16),
            crossAxisCount: wide ? 2 : 1,
            childAspectRatio: wide ? 2.4 : 2.8,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: cards,
          );
        },
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Card(
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon), const SizedBox(width: 12), Text(label)],
      ),
    ),
  );
}
