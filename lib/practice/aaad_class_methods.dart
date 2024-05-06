class Vector {
  double x;
  double y;

  Vector(this.x, this.y);

  Vector operator +(Vector v1) {
    return Vector(x + v1.x, y + v1.y);
  }

  Vector operator -(Vector v1) {
    return Vector(x - v1.x, y - v1.y);
  }

  @override
  bool operator ==(Object other) {
    return x == (other as Vector).x && y == (other).y;
  }

  @override
  int get hashCode => x.toInt() | y.toInt();
}