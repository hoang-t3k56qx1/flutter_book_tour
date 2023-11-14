import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../model/tour_model.dart';
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

  Future<Response> deleteTour(int  id) async {
    final response = await dio.delete("${url}/tours/$id");
    print("${url}/tours/name/$id");
    return response;
  }

  Future<Response> createTour(Tour  tour) async {
    final response = await dio.post("${url}/tours", data: jsonEncode(tour));
    print("${url}/tours");
    return response;
  }

  Future<Response> updateTour(Tour  tour) async {
    final response = await dio.put("${url}/tours", data: jsonEncode(tour));
    print("${url}/tours");
    return response;
  }
}