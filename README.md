# Flutter 循序练习项目

这是一个可以从零开始、逐节手敲的 Flutter 学习项目。16 节内容从 Dart 基础逐步推进到一个分层的任务清单应用；总入口可以直接打开所有章节，每一节也可以独立运行。

## 开始前

```powershell
flutter pub get
flutter run
```

建议不要直接复制答案。先阅读本节目标，自己创建文件并运行；遇到问题后再对照仓库中的完整实现。

每节独立运行的命令格式如下：

```powershell
flutter run -t lib/practice/day01_variables.dart
```

把文件名替换为对应章节即可。完成代码后固定执行：

```powershell
dart format .
flutter analyze
flutter test
```

## 推荐学习方式

1. 新建一个空白分支或空白 Flutter 工程。
2. 按下面的“手敲顺序”创建本节文件。
3. 每完成一个小步骤就运行一次，观察界面变化。
4. 完成本节挑战，不看答案重写一次关键 Widget。
5. 提交一次 Git，让每一节都成为可回退的学习节点。

## 课程路线

| 节次 | 主题 | 文件 | 完成标准 |
| --- | --- | --- | --- |
| 01 | 变量、类型与空安全 | `day01_variables.dart` | 能解释 `final`、`const`、`?`、`??` |
| 02 | 函数与参数 | `day02_functions.dart` | 会写位置参数、命名参数和返回值 |
| 03 | 集合与流程控制 | `day03_collections.dart` | 会转换、过滤 List/Set/Map |
| 04 | 类与不可变模型 | `day04_classes.dart` | 会写不可变模型和 `copyWith` |
| 05 | StatelessWidget | `day05_stateless_widget.dart` | 会把大界面拆成小组件 |
| 06 | 布局与约束 | `day06_layout.dart` | 理解 `Expanded`、间距和约束 |
| 07 | StatefulWidget | `day07_stateful_widget.dart` | 会用 `setState` 管理局部状态 |
| 08 | 表单与校验 | `day08_form.dart` | 会校验输入并释放 Controller |
| 09 | 动态列表 | `day09_lists.dart` | 会增删列表并使用稳定 Key |
| 10 | 页面导航 | `day10_navigation.dart` | 会传递参数并接收页面返回值 |
| 11 | 异步状态 | `day11_async.dart` | 会呈现加载、成功、空和错误状态 |
| 12 | 状态提升 | `day12_state_management.dart` | 会分离状态与界面 |
| 13 | 隐式动画 | `day13_animation.dart` | 会给状态变化添加自然过渡 |
| 14 | 响应式与主题 | `day14_responsive_theme.dart` | 会适配宽度和明暗主题 |
| 15 | 分层架构 | `day15_architecture.dart` | 理解 model/repository/controller/view |
| 16 | 综合任务清单 | `day16_final_project.dart` | 独立完成增删改、筛选和测试 |

## 每节手敲清单

### 01—04：Dart 基础

- 01：先声明 `String/int/double/bool`，再添加可空变量，最后把值渲染到列表。挑战：增加“今日学习时长”。
- 02：先写 `add` 和 `greet`，再实现空集合安全的 `average`。挑战：写一个带命名参数的分数评级函数。
- 03：创建主题 `List`、已完成 `Set`、时长 `Map`，用 `where` 得到未完成项。挑战：计算总学习时长。
- 04：创建全部字段为 `final` 的 `Course`，实现 `copyWith`。挑战：增加难度枚举并显示它。

### 05—10：Flutter 界面与交互

- 05：先搭 `Scaffold`，再抽取 `ProfileCard`。挑战：再抽取一个可复用的信息行组件。
- 06：用 `Column` 纵向布局，用 `Expanded` 分配剩余空间。挑战：把比例从 1:2 改为 2:3。
- 07：把计数放入 `State`，所有修改都通过小方法调用 `setState`。挑战：增加减一按钮并禁止负数。
- 08：依次加入 `Form`、`GlobalKey`、`TextEditingController`、校验器和提交反馈。挑战：增加邮箱字段。
- 09：先用 `ListView.builder` 渲染，再实现添加与滑动删除。挑战：删除后提供撤销操作。
- 10：先 push 详情页，再通过 `pop(result)` 返回结果；异步回来后检查 `mounted`。挑战：给选择页传入自定义主题列表。

### 11—15：工程能力

- 11：把异步读取放进 Repository，用 `FutureBuilder` 显示加载/错误/成功。挑战：让仓库主动抛错并验证重试界面。
- 12：让 `CounterController` 保存状态，Widget 只监听和派发动作。挑战：增加步长设置。
- 13：用 `AnimatedContainer` 和 `AnimatedAlign` 为同一个状态制作过渡。挑战：加入 `AnimatedSwitcher`。
- 14：用 `LayoutBuilder` 决定列数，用 `ThemeMode` 切换明暗主题。挑战：增加“跟随系统”选项。
- 15：依次手敲 `Lesson`、Repository 接口、内存实现、Controller、View。挑战：写一个失败的 Repository 测试错误状态。

### 16：综合项目

按这个顺序创建文件，不要一次写完：

```text
lib/final_project/
├── models/study_task.dart
├── repositories/task_repository.dart
├── controllers/task_controller.dart
└── views/task_page.dart
```

1. Model：只表达任务数据，并用 `copyWith` 产生新对象。
2. Repository：定义读取与保存契约，内存实现不泄露可变 List。
3. Controller：实现加载、添加、切换完成、删除、筛选；界面只读取公开状态。
4. View：实现加载/错误/空/数据状态，添加对话框、滑动删除和筛选按钮。
5. Test：验证初始加载、标题清理、状态切换、筛选和删除。

当前 Repository 是内存实现，应用重启后数据会恢复。这是刻意保留的下一阶段练习：可以在不修改 Controller 和 View 的前提下，新增本地数据库 Repository。

## 工程约定

- 默认使用 Material 3 和主题颜色，不在业务 Widget 中散落全局样式。
- 数据模型不可变；可变状态由最靠近使用位置的 State 或 Controller 持有。
- 异步界面必须考虑加载、成功、空数据、错误和重试。
- 创建 `TextEditingController`、`ChangeNotifier` 等资源后必须 `dispose`。
- 动态列表使用来自数据身份的稳定 Key，不使用随机 Key。
- 先使用 Flutter SDK 自带能力；当复杂度确实增长时再引入路由、状态管理、网络和持久化包。

## 目录

```text
lib/
├── main.dart                 # 课程导航入口
├── practice/                 # 01—16 独立练习入口
└── final_project/            # 综合项目的分层代码
test/
├── widget_test.dart          # 导航页与交互测试
└── task_controller_test.dart # 综合项目状态测试
```
