# demo001

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Flutter 待解决问题
## 一、基础技术类
1. late 关键字的使用
```dart
  // late 正确使用姿势 TODO zfc
  static HiNet? _instance;

  static HiNet getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance!;
  }
```

2. 协程
    a. Future 使用。
    b. Future 一些操作符。
3. 类与构造函数
    a. 必传参数、 以及实参列表中的{} 的含义等
## 二、项目架构设计类

