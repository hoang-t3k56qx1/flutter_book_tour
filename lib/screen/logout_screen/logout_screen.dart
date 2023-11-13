import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_book_tour/screen/login_screen/login_screen_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../assets_manager.dart';
import '../../provider/user_provider.dart';
import '../home_screen/screen/home_screen_view.dart';
import '../notifi_screen/notifi_screen.dart';

class LogoutScreenView extends StatefulWidget {
  const LogoutScreenView({super.key});

  @override
  State<LogoutScreenView> createState() => _LogoutScreenViewState();
}

class _LogoutScreenViewState extends State<LogoutScreenView> {
  final _usenameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  bool ischeckMK = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Center(child: Text('ĐĂNG KÝ')),
        toolbarHeight: 80,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
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
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
                  'Đăng ký',
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
                  controller: _usenameController,
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
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Tên người dùng',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      String username = _usenameController.text.trim();
                      String password = _passwordController.text.trim();
                      String name = _nameController.text.trim();
                      String email = _emailController.text.trim();
                      if (username.isEmpty ||
                          password.isEmpty ||
                          name.isEmpty ||
                          email.isEmpty) {
                        String content = "Vui lòng nhập đủ các thông tin !";
                        showNotifi(context, content);
                      } else {
                        final provider =
                            Provider.of<UserProvide>(context, listen: false);
                        User user = User(
                            username: username,
                            password: password,
                            email: email,
                            name: name,
                            avt: "");
                        await provider.createUser(user);
                        final status = provider.statusDK;
                        if (status == Status.loading) {
                          ShowThongBao.show("loading");
                        }
                        if (status == Status.success) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreenView(),
                          ));
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Đăng ký tài khoản thành công!'),
                              backgroundColor: Colors.lightBlue,
                              // Đặt màu nền thành màu xanh
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'Đóng',
                                onPressed: () {
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                        }
                        if (status == Status.nodata) {
                          // ignore: use_build_context_synchronously
                          showNotifi(context, "Tài khoản đã tồn tại !");
                        }
                        if (status == Status.failure) {
                          // ignore: use_build_context_synchronously
                          showNotifi(context, "Tài khoản đã tồn tại !");
                        }
                      }

                    },
                    child: const Text(
                      'Đăng ký',
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
                          builder: (context) => LoginScreenView(),
                        ));
                      },
                      child: const SizedBox(
                        height: 30,
                        child: Text(
                          "Quay về đăng nhập",
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
}
