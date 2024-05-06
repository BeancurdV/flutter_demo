import 'package:demo001/http/core/hi_net.dart';
import 'package:demo001/http/request/base_request.dart';
import 'package:demo001/http/request/login_request.dart';
import 'package:demo001/http/request/registration_request.dart';

class LoginDao {
  static login(String userName, String pwd) {
    _send(userName, pwd);
  }

  static register(String userName, String pwd, String imoocId, String orderId) {
    _send(userName, pwd, imoocId: imoocId, orderId: orderId);
  }

  static _send(String userName, String pwd, {imoocId, orderId}) async {
    BaseRequest request;
    if (imoocId != null && orderId != null) {
      request = RegistrationRequest();
    } else {
      request = LoginRequest();
    }
    request
        .add('userName', userName)
        .add('password', pwd)
        .add('moocId', imoocId)
        .add('orderId', orderId);
    var result = await HiNet.getInstance().fire(request);
    print(result);
    return result;
  }
}
