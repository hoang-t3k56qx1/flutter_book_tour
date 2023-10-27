import 'package:flutter/material.dart';
import 'package:flutter_book_tour/screen/admin_screen/admin_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets_manager.dart';
import '../home_screen/screen/home_screen_view.dart';
import '../logout_screen/logout_screen.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool ischeckMK = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0561FB),
      // appBar: AppBar(
      //   title: const Center(child: Text('ĐẶT TOUR DU LỊCH')),
      //   toolbarHeight: 80,
      //   titleTextStyle: const TextStyle(
      //     fontWeight: FontWeight.w600,
      //     fontSize: 30
      //   ),
      // ),
      body: _buildBody(),
    );
  }

  _buildBody() {
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
                  onPressed: () {
                    String username = _userNameController.text.trim();
                    String password = _passwordController.text.trim();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomeScreenView(),
                    ));
                  },
                  child: const Text(
                    'Đăng Nhập',
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

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
