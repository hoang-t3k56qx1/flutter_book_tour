
import 'package:flutter/cupertino.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_book_tour/service/user_service.dart';


enum Status  {initial,loading, success, nodata, failure}


class UserProvide extends ChangeNotifier{

  late UserService userService = UserService();

  Status status = Status.initial;

  Status statusDK = Status.initial;
  User user = User();


  Future<void> login(String username,String password) async {
    status = Status.loading;
    notifyListeners();
    try {
      final response = await userService.login(username, password);
      dynamic jsonData = response.data;
      if (jsonData != null && jsonData.toString().isNotEmpty) {
        user = User.fromJson(jsonData as Map<String, dynamic>);
        status = Status.success;
        notifyListeners();
      } else {
        status = Status.nodata;
        notifyListeners();
      }
    } catch(e) {
      print(e.toString());
      status = Status.failure;
      notifyListeners();
    }
  }

  Future<void> createUser(User user) async {
    statusDK = Status.loading;
    notifyListeners();
    try {
      final response = await userService.createUser(user);
      dynamic jsonData = response.data;
      if (jsonData != null && jsonData.toString().isNotEmpty) {
        user = User.fromJson(jsonData as Map<String, dynamic>);
        statusDK = Status.success;
        notifyListeners();
      } else {
        statusDK = Status.nodata;
        notifyListeners();
      }
    } catch(e) {
      print(e.toString());
      statusDK = Status.failure;
      notifyListeners();
    }
  }

}