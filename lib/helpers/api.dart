import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sushiarigato/helpers/session.dart';
import 'error.dart';

class Api {
  Future<dynamic> get(dynamic url) async {
    var token = await Session().getToken();
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    });

    return jsonDecode(response.body);
  }

  Future<dynamic> post(dynamic url, dynamic data) async {
    var token = await Session().getToken();
    final response = await http.post(Uri.parse(url), body: data, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    });

    return jsonDecode(response.body);
  }

  Future<dynamic> put(dynamic url, dynamic data) async {
    var token = await Session().getToken();
    final response = await http.put(Uri.parse(url), body: data, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    });

    return jsonDecode(response.body);
  }

  Future<dynamic> delete(dynamic url) async {
    var token = await Session().getToken();
    final response = await http.delete(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
    });

    return jsonDecode(response.body);
  }

  dynamic responseCheck(http.Response response) {
    debugPrint(response.body.toString());
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return BadRequest(response.body.toString());
      case 401:
        return Unauthorised(response.body.toString());
      case 422:
        return UnprocessableEntity(response.body.toString());
      case 403:
        return Forbidden(response.body.toString());
      case 404:
        return NotFound(response.body.toString());
      case 405:
        return MethodNotAllowed(response.body.toString());
      case 408:
        return RequestTimeout(response.body.toString());
      case 500:
        return InternalServerError(response.body.toString());
      case 502:
        return BadRequest(response.body.toString());
      default:
        return FetchData(response.body.toString());
    }
  }
}
