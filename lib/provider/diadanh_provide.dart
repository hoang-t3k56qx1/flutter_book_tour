import 'package:flutter/cupertino.dart';
import 'package:flutter_book_tour/model/dondat_model.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_book_tour/provider/user_provider.dart';
import 'package:flutter_book_tour/service/diadanh_service.dart';
import 'package:flutter_book_tour/service/user_service.dart';

import '../model/diadanh_model.dart';
import '../service/dondat_service.dart';


class DiaDanhProvide extends ChangeNotifier {

  late DiaDanhService diaDanhService = DiaDanhService();

  Status status = Status.initial;
  List<DiaDanh> list = [];

  Future<void> allDiaDanh() async {
    status = Status.loading;
    notifyListeners();
    try {
      final response = await diaDanhService.allDiaDanh();
      List jsonData = response.data;
      if (jsonData != null && jsonData.toString().isNotEmpty) {
        list = jsonData.map((e) => DiaDanh.fromJson(e as Map<String, dynamic>)).toList();
        print(list);
        status = Status.success;
        notifyListeners();
      } else {
        status = Status.nodata;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      status = Status.failure;
      notifyListeners();
    }
  }
}