import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_daily_practice/final_project/controllers/task_controller.dart';
import 'package:flutter_daily_practice/final_project/repositories/task_repository.dart';

void main() {
  late TaskController controller;

  setUp(() {
    controller = TaskController(MemoryTaskRepository());
  });

  tearDown(() => controller.dispose());

  test('加载、添加、切换、筛选和删除任务', () async {
    await controller.load();
    expect(controller.tasks, hasLength(2));

    await controller.add('  编写测试  ');
    expect(controller.tasks.last.title, '编写测试');

    final id = controller.tasks.last.id;
    await controller.toggle(id);
    expect(controller.completedCount, 1);

    controller.changeFilter(TaskFilter.completed);
    expect(controller.tasks.single.id, id);

    await controller.remove(id);
    expect(controller.tasks, isEmpty);
  });

  test('忽略空白标题', () async {
    await controller.load();
    await controller.add('   ');
    expect(controller.tasks, hasLength(2));
  });
}
