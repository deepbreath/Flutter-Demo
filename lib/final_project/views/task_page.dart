import 'package:flutter/material.dart';

import '../controllers/task_controller.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({required this.controller, super.key});

  final TaskController controller;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  Future<void> _showAddDialog() async {
    final textController = TextEditingController();
    final title = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('添加学习任务'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: const InputDecoration(hintText: '例如：练习表单校验'),
          onSubmitted: (value) => Navigator.of(dialogContext).pop(value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, textController.text),
            child: const Text('添加'),
          ),
        ],
      ),
    );
    textController.dispose();
    if (title != null) await widget.controller.add(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('16 · 学习任务清单')),
      body: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          if (widget.controller.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (widget.controller.error != null) {
            return _ErrorView(onRetry: widget.controller.load);
          }
          return Column(
            children: [
              _FilterBar(controller: widget.controller),
              Expanded(
                child: widget.controller.tasks.isEmpty
                    ? const Center(child: Text('这个分类下还没有任务'))
                    : ListView.builder(
                        itemCount: widget.controller.tasks.length,
                        itemBuilder: (context, index) {
                          final task = widget.controller.tasks[index];
                          return Dismissible(
                            key: ValueKey(task.id),
                            direction: DismissDirection.endToStart,
                            background: const ColoredBox(
                              color: Colors.redAccent,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onDismissed: (_) =>
                                widget.controller.remove(task.id),
                            child: CheckboxListTile(
                              value: task.completed,
                              onChanged: (_) =>
                                  widget.controller.toggle(task.id),
                              title: Text(
                                task.title,
                                style: TextStyle(
                                  decoration: task.completed
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('已完成 ${widget.controller.completedCount} 项'),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddDialog,
        icon: const Icon(Icons.add),
        label: const Text('添加任务'),
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({required this.controller});

  final TaskController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(12),
      child: SegmentedButton<TaskFilter>(
        segments: const [
          ButtonSegment(value: TaskFilter.all, label: Text('全部')),
          ButtonSegment(value: TaskFilter.active, label: Text('进行中')),
          ButtonSegment(value: TaskFilter.completed, label: Text('已完成')),
        ],
        selected: {controller.filter},
        onSelectionChanged: (selection) =>
            controller.changeFilter(selection.first),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: FilledButton(onPressed: onRetry, child: const Text('加载失败，点击重试')),
  );
}
