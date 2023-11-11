
import 'package:flutter/cupertino.dart';
import 'package:flutter_book_tour/model/dondat_model.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_book_tour/provider/user_provider.dart';
import 'package:flutter_book_tour/service/user_service.dart';

import '../service/dondat_service.dart';


class DonDatProvide extends ChangeNotifier{

  late DonDatService donDatService = DonDatService();

  Status status = Status.initial;
  Future<void> saveDonDat(DonDat donDat) async {
    status = Status.loading;
    notifyListeners();
    try {
      final response = await donDatService.saveDonDat(donDat);
      dynamic jsonData = response.data;
      if (jsonData != null && jsonData.toString().isNotEmpty) {
        status = Status.success;
        notifyListeners();
      } else {
        status = Status.failure;;
        notifyListeners();
      }
    } catch(e) {
      print(e.toString());
      status = Status.failure;
      notifyListeners();
    }
  }

}