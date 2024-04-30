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
