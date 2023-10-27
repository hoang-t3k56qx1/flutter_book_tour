import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets_manager.dart';
import '../home_screen/screen/home_screen_view.dart';

class LogoutScreenView extends StatefulWidget{
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
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody(){
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _usenameController,
                  decoration: const InputDecoration(
                    labelText: 'Tài khoản',
                    border: OutlineInputBorder(
                        borderRadius : BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: ischeckMK,
                  decoration:  InputDecoration(
                    labelText: 'Mật Khẩu',
                    border: const OutlineInputBorder(
                        borderRadius : BorderRadius.all(Radius.circular(12))
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(ischeckMK ? Icons.visibility : Icons.visibility_off),
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
                        borderRadius : BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius : BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      String username = _usenameController.text;
                      String password = _passwordController.text;
                      String name = _passwordController.text;
                      String email = _passwordController.text;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreenView(),
                      ));
                    },
                    child: const Text(
                      'Đăng ký',
                    ),
                  ),
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
}