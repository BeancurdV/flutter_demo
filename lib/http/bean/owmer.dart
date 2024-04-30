class Owner {
  String? name;
  String? face;
  int? fans;

  Owner({this.name, this.face, this.fans});

  Owner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    face = json['face'];
    fans = json['fans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['name'] = name;
    data['face'] = face;
    data['fans'] = fans;
    return data;
  }

  void testV01() {
    var json = {"name": "xxx", "face": "yyyy", "fans": 1};
  }
}
