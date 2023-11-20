import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_book_tour/model/dondat_model.dart';

import '../setting_manager.dart';
import 'dio_singleton.dart';

class DiaDanhService {

  final url = BaseURL.urlAPI;
  late Dio dio = Dio();

  DiaDanhService();

  Future<Response> allDiaDanh() async {
    final response = await dio.get("${url}/diadanhs");
    print("${url}/diadanhs");
    return response;
  }

}