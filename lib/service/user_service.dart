import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

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
}