// 网络异常统一格式类
// 缺点： 业务和通信耦合啦吧？
class HiNetError implements Exception {
  final int? code;
  final String message;
  final dynamic data;

  HiNetError({required this.code, required this.message, this.data});
}

class NeedAuth extends HiNetError {
  NeedAuth(String message, {int code = 403, dynamic data})
      : super(code: code, message: message, data: data);
}

class NeedLogin extends HiNetError {
  NeedLogin({int code = 403, String message = '请先需要登录'})
      : super(code: code, message: message);
}
