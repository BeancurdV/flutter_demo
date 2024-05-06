class DartPoint {
  int x;
  int y;

  DartPoint(this.x, this.y);

  static DartPoint fromJson(Map<String, dynamic> json) {
    var x = json['x'];
    var y = json['y'];
    return DartPoint(x, y);
  }
}

class ImmutableDartPoint implements DartPoint {
  @override
  final int x;

  @override
  final int y;

  const ImmutableDartPoint(this.x, this.y);

  @override
  set x(int _x) {}

  @override
  set y(int _y) {}
}

class ConstructorTest {
  static void testForConstructor() {
    var p1 = DartPoint(2, 2);
    var p2 = DartPoint.fromJson({'x': 1, 'y': 2});
    assert(!identical(p1, p2)); // false
  }

  static void testImmutablePoint() {
    var p = const ImmutableDartPoint(2, 2);
    var q = const ImmutableDartPoint(2, 2);
    var w = ImmutableDartPoint(2, 2);
    assert(identical(p, q)); // true
    assert(identical(p, w)); // false
  }
}

class ConstructorPerson {
  int x = 0;
  int y = 0;

  ConstructorPerson(int xx, int yy) {
    x = xx;
    y = yy;
  }
}

class Living {
  String? name;

  Living(String? name) {
    this.name = name;
  }
}

class ConstructorDog extends Living {
  int age;

  ConstructorDog(super.name, this.age);
}

class NameConstruct {
  String name;

  NameConstruct(this.name);

  NameConstruct.n() : this('');
}

class NameConstructV2 extends Living {
  NameConstructV2.n() : super('');
}

class InitialConstruct {
  int x;
  int y;
  int z;

  // 默认参数列表
  InitialConstruct(this.x, {this.y = 0}) : z = 0;

  // 构造函数重定向
  InitialConstruct.y(int y) : this(0, y: y);
}

class ConstantsConstruct {
  final int _x;
  final int _y;

  const ConstantsConstruct(this._x, this._y);

  static const orginal = ConstantsConstruct(0, 0);
}

// main() {
//   ConstantsConstruct.orginal;
// }
