import 'package:demo001/http/core/hi_error.dart';
import 'package:demo001/http/core/hi_net_adapter.dart';
import 'package:demo001/http/core/mock_adapter.dart';
import 'package:demo001/http/request/base_request.dart';

/**
 * TODO
 *  1. Dart 异步设施：
 *    Future 、 Async  Await的概念
 */
class HiNet {
  HiNet._();

  // late 正确使用姿势 TODO zfc
  static HiNet? _instance;

  static HiNet getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance!;
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    print('url:${request.url()}');
    print('method:${request.httpMethod()}');
    request.add('token', '123');
    print('headers : ${request.header}');
    // return Future(() => null)
    // return Future.value({
    //   "statusCode": 200,
    //   "data": {"code": 0, "message": "success"}
    // });
    HiNetAdapter dapter = HiNetMockAdapter();
    return dapter.send(request);
  }

  Future fire(BaseRequest request) async {
    HiNetResponse? response;
    var error;

    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      printLog(e);
    } catch (e) {
      error = e;
      printLog(e);
    }

    if (response == null) {
      printLog(error);
      throw HiNetError(code: 10086, message: 'repsonse is null', data: null);
    } else {
      var result = response.data;
      var status = response.statusCode;

      switch (status) {
        case 200:
          return result;
        case 401:
          throw NeedLogin();
        case 403:
          throw NeedAuth(result.toString(), data: result);
        default:
          throw HiNetError(
              code: status, message: result.toString(), data: result);
      }
    }
  }

  void printLog(log) {
    print('hi_net:${log.toString()}');
  }
}
