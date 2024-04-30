import 'package:demo001/http/core/hi_net_adapter.dart';
import 'package:demo001/http/request/base_request.dart';

class HiNetMockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse<T>>.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: {
            "code": 0,
            "mesage": 'success',
          } as T,
          statusCode: 200);
    });
  }
}
