import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../setting_manager.dart';
import 'dio_singleton.dart';

class TourService {

  final url = BaseURL.urlAPI;
  late Dio dio = Dio();

  TourService();

  Future<Response> listTourByName(String key) async {
    final response = await dio.get("${url}/tours/name?key=$key");
    print("${url}/tours/name?key=$key");
    return response;
  }

  Future<Response> listTour() async {
    final response = await dio.get("${url}/tours");
    print("${url}/tours/name");
    return response;
  }
}