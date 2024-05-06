class Vector {
  double x;
  double y;

  Vector(this.x, this.y);

  Vector operator +(Vector v1) => Vector(x + v1.x, y + v1.y);

  Vector operator -(Vector v1) => Vector(x - v1.x, y - v1.y);

  @override
  bool operator ==(Object other) => x == (other as Vector).x && y == (other).y;

  @override
  int get hashCode => x.toInt() | y.toInt();
}

class Rectangle {
  int left;
  int width;
  int top;
  int height;

  Rectangle(this.left, this.top, this.width, this.height);

  int get right => left + width;

  set right(int right) {
    left = right - width;
  }

  int get bottom => top + height;

  set bottom(int bottom) {
    top = bottom - height;
  }
}
