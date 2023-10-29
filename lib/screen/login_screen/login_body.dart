import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_tour/provider/user_provide.dart';
import 'package:flutter_book_tour/screen/notifi_screen/notifi_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../assets_manager.dart';
import '../home_screen/screen/home_screen_view.dart';
import '../logout_screen/logout_screen.dart';

class LoginBody extends StatefulWidget {
  LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool ischeckMK = true;


  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<UserProvide>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Container(
          // height: 350,
          decoration: BoxDecoration(
            color: Colors.white, // Màu nền của Container
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImageAssets.ic_tour,
                  height: 60,
                  width: 60,
                ),
                const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    color: Color(0xFF036BCB),
                    fontSize: 26,
                    fontFamily: 'Barlow Condensed',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    labelText: 'Tài khoản',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: ischeckMK,
                  decoration: InputDecoration(
                    labelText: 'Mật Khẩu',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    suffixIcon: IconButton(
                      icon: Icon(
                          ischeckMK ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          ischeckMK = !ischeckMK;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = _userNameController.text.trim();
                    String password = _passwordController.text.trim();
                    if (username.isEmpty || password.isEmpty) {
                      String mess = "Tài khoản mật khẩu không được để trống!";
                      showNotifi(context, mess);
                    } else {
                      final userProvider = Provider.of<UserProvide>(context, listen: false);
                       await userProvider.login(username, password);
                       final status = userProvider.status;
                      if (status == Status.loading) {
                        ShowThongBao.show("loading");
                      }
                      if (status == Status.success) {
                        final sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.setString("user",jsonEncode(userProvider.user));
                        sharedPreferences.setBool("checkLogin", true);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreenView(),
                        ));
                      }
                      if (status == Status.nodata) {
                        showNotifi(context, "Thông tin tài khoản mật khẩu không chính xác!");
                      }
                      if (status == Status.failure) {
                        showNotifi(context, "Có lỗi xảy ra. Vui lòng thử lại!");
                      }
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Đăng Nhập',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LogoutScreenView(),
                        ));
                      },
                      child: const SizedBox(
                        height: 30,
                        child: Text(
                          "Đăng ký tài khoản",
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showNotifi(BuildContext context, String mess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
            'Thông báo',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          content: Text(
            mess,
            style: const TextStyle(color: Colors.red),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // call api xóa và tải lại dữ liệu
                Navigator.of(context).pop();
              },
              child: const Center(child: Text('Đóng')),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
