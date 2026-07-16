# Flutter 每日练习

这是一个按天、按章节组织的 Flutter 练习项目。整个仓库只有一个 Flutter 工程，每天的练习通过 `lib/practice/` 下的独立 Dart 文件组织。

## 目录结构

```text
lib/
├── main.dart
└── practice/
    ├── day01_variables.dart
    ├── day02_functions.dart
    ├── day03_classes.dart
    ├── day04_widget.dart
    └── day05_stateful_widget.dart
```

每个练习文件都有独立的 `main()`，互不影响。

## 启动练习

先在仓库根目录安装依赖：

```powershell
flutter pub get
```

启动默认的章节导航页：

```powershell
flutter run
```

单独启动某一天：

```powershell
flutter run -t lib/practice/day01_variables.dart
flutter run -t lib/practice/day02_functions.dart
flutter run -t lib/practice/day03_classes.dart
flutter run -t lib/practice/day04_widget.dart
flutter run -t lib/practice/day05_stateful_widget.dart
```

如果有多个设备，可以先执行 `flutter devices`，然后通过 `-d` 指定设备：

```powershell
flutter run -d chrome -t lib/practice/day01_variables.dart
```

## 添加下一天练习

1. 在 `lib/practice/` 下创建文件，例如 `day06_layout.dart`。
2. 在文件中编写独立的 `void main()` 和练习 Widget。
3. 使用下面的命令运行：

```powershell
flutter run -t lib/practice/day06_layout.dart
```

4. 如需显示在导航页中，把新章节加入 `lib/main.dart` 的 `practices` 列表。
