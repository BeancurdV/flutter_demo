class RuntimeTypeV2 {
  String? name;
  RuntimeTypeV2(this.name);
}

class RuntimeType {
  String? name;
  RuntimeType(this.name);

  static void testRuntimeType() {
    print(RuntimeType('beancurdv').runtimeType);
    print(RuntimeTypeV2('beancurdv').runtimeType);
  }
}
