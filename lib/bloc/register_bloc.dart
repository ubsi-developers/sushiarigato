import 'package:sushiarigato/config/url.dart';
import 'package:sushiarigato/helpers/api.dart';
import 'package:sushiarigato/model/register.dart';

class RegisterBloc {
  static Future<dynamic> register(
      {String? name, String? email, String? password, String? address}) async {
    try {
      var url = Url.register;
      var body = {
        "name": name,
        "email": email,
        "password": password,
        "address": address,
      };

      var response = await Api().post(url, body);

      if (response["status"] != false) {
        return Register.fromJson(response);
      } else {
        return response["message"];
      }
    } catch (error) {
      return error.toString();
    }
  }
}
