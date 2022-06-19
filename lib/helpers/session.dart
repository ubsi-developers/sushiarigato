import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Session {
  final storage = const FlutterSecureStorage();

  Future<bool> setToken(String value) async {
    await storage.write(key: 'token', value: value);
    return true;
  }

  Future<String?> getToken() async {
    String? value = await storage.read(key: 'token');
    return value;
  }

  Future<bool> clearToken() async {
    await storage.delete(key: 'token');
    return true;
  }

  Future<bool> setUserId(String value) async {
    await storage.write(key: 'user_id', value: value);
    return true;
  }

  Future<String?> getUserId() async {
    String? value = await storage.read(key: 'user_id');
    return value;
  }

  Future<bool> clearUserId() async {
    await storage.delete(key: 'user_id');
    return true;
  }
}
