enum HttpMethod { GET, POST, DELTE }

/**
 * 第一阶段：
 *    1. 参数分类  路径参数、接口参数、Header参数、鉴权参数
 *    2. 请求方式
 *    3. http or https
 */
abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String authority() {
    return 'api.devio.org';
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();

    // 拼接path参数
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    return uri.toString();
  }

  bool needLogin();

  Map<String, String> params = Map();

  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = Map();

  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
