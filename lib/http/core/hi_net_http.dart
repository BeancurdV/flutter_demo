import 'package:demo001/http/core/hi_net_adapter.dart';
import 'package:demo001/http/request/base_request.dart';
import 'package:http/http.dart' as http;

import 'hi_error.dart';

class HttpNetAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) async {
    var method = request.httpMethod();
    var response;
    var error;
    try {
      if (method == HttpMethod.GET) {
        response = http.get(Uri.parse(request.url()));
      } else if (method == HttpMethod.POST) {
        response = http.post(Uri.parse(request.url()),
            headers: request.header
                .map((key, value) => MapEntry(key, value.toString())),
            body: request.params);
      } else if (method == HttpMethod.DELTE) {
        response = http.delete(Uri.parse(request.url()),
            headers: request.header
                .map((key, value) => MapEntry(key, value.toString())),
            body: request.params);
      } else {
        throw Exception("method ${method} is not supported !!");
      }
    } on http.ClientException catch (e) {
      error = e;
    } catch (e) {
      error = e;
    }

    if (error != null) {
      throw HiNetError(
          code: response?.statusCode ?? -1,
          message: error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request) as HiNetResponse<T>;
  }

  HiNetResponse buildRes(http.Response? response, BaseRequest request) {
    return HiNetResponse(
        data: response?.body,
        request: request,
        statusCode: response?.statusCode,
        statusMessage: response?.reasonPhrase,
        extra: '');
  }
}
