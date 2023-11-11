import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_book_tour/model/dondat_model.dart';

import '../setting_manager.dart';
import 'dio_singleton.dart';

class DonDatService {

  final url = BaseURL.urlAPI;
  late Dio dio = Dio();

  DonDatService();

  Future<Response> listDonDatById(int id) async {
    final response = await dio.get("${url}/dondats/$id");
    print("${url}/hoadons/$id");
    return response;
  }

  Future<Response> saveDonDat(DonDat donDat) async {
    final response = await dio.post("${url}/dondats", data: jsonEncode(donDat));
    print("${url}/hoadons");
    return response;
  }
}