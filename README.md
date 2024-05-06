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
延迟初始化， 和kotlin中的lazy很像，其作用有二：
a. 声明非空类型，延迟初始化
b. 声明非空类型，并定义延迟初始化的方式。
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
3. 类与构造函数
    a. 必传参数、 以及实参列表中的{} 的含义等
    b. 私有化构造函数 _() ？

2. 协程
    a. Future 使用。
    b. Future 一些操作符。
4. 扩展函数， 我有一点不理解的地方。
    a. 静态方法 怎么能调用到 非静态的扩展方法呢？

## 二、项目架构设计类
1. Flutter中是否有GSON、Jackson、FastJson ？
2. 是否需要使用Model ， 要不要直接使用MAP？
三种序列化方式：
a. 手写实体类
b. 网页自动生成实体类 (https://www.devio.org/io/tools/json-to-dart)
c. json_serializable (json_annotation: ^4.9.0)
    ```dart
    dart run build_runner build  //在项目根目录下运行
    ```
d. 升级版 json_serializable + 插件 ： https://zhuanlan.zhihu.com/p/516791306

看一下这三个库，都能够做什么。

## 三、常用的库
1. json 使用的是 Dart:convert库， 利用 jsonDecode or jsonEncode
2. http 冲突解决。


## 四、接口
1. 登录、退出、注册接口
