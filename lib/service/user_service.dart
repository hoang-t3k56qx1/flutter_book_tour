import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../setting_manager.dart';
import 'dio_singleton.dart';

class UserService {

  final url = BaseURL.urlAPI;
  late Dio dio = Dio();

  UserService();

  Future<Response> login(String username, String password) async {
    final response = await dio.get("${url}/users/login?username=${username}&password=${password}");
    print("${url}/users/login?username=${username}&password=${password}");
    return response;
  }

  Future<Response> createUser(User user) async {
    final response = await dio.post("${url}/users", data: jsonEncode(user));
    print("${url}/users");
    return response;
  }
}