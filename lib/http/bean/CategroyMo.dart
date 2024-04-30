class CategoryMo {
  String? name;
  int? count;

  CategoryMo({this.name, this.count});

  void fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['count'] = count;
    return data;
  }

  var json =
      '{"code":0 , "data":{ "code": 0  , "method":"GET"  , "requestParams":"test"} , "msg":"SUCCESS." }';
}
