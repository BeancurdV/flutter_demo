import 'package:demo001/http/request/base_request.dart';

/**
 * TODO
 *  1. Dart 异步设施：
 *    Future 、 Async  Await的概念
 */
class HiNet {
  HiNet._();

  static late HiNet _instance;

  static HiNet getInstance() {
    _instance ??= HiNet._();
    return _instance;
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    print('url:${request.url()}');
    print('method:${request.httpMethod()}');
    request.add('token', '123');
    print('headers : ${request.header}');
    // return Future(() => null)
    return Future.value({
      "statusCode": 200,
      "data": {"code": 0, "message": "success"}
    });
  }

  Future fire(BaseRequest request) async {
    var response = await send(request);
    // caice ： 这里开始一个Adapter类，桥接出去
    var result = response['data'];
    // caice : 统一异常处理
    print(result);
    return result;
  }

  void printLog(log) {
    print('hi_net:${log.toString()}');
  }
}
