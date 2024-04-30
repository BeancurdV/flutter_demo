import 'package:demo001/http/core/hi_error.dart';
import 'package:demo001/http/core/hi_net_adapter.dart';
import 'package:demo001/http/request/base_request.dart';
import 'package:dio/dio.dart';

// 1. pub.dev --> search dart
class DioNetAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) async {
    Response? response;
    var options = Options(headers: request.header);
    var error;

    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.DELTE) {
        response = await Dio()
            .delete(request.url(), data: request.params, options: options);
      }
    } on DioException catch (e) {
      error = e;
      response = e.response;
    }
    if (error != null) {
      throw HiNetError(
          code: response?.statusCode ?? -1,
          message: error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request) as HiNetResponse<T>;
  }

  HiNetResponse buildRes(Response? response, BaseRequest request) {
    return HiNetResponse(
        data: response?.data,
        request: request,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
        extra: response?.extra);
  }
}
