import 'package:sushiarigato/config/url.dart';
import 'package:sushiarigato/helpers/api.dart';
import 'package:sushiarigato/model/login.dart';

class LoginBloc {
  static Future<dynamic> login({String? email, String? password}) async {
    try {
      var url = Url.login;
      var body = {
        "email": email,
        "password": password,
      };

      var response = await Api().post(url, body);

      if (response["status"] != false) {
        return Login.fromJson(response);
      } else {
        return response["message"];
      }
    } catch (error) {
      return error.toString();
    }
  }
}
