import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets_manager.dart';
import '../home_screen/screen/home_screen_view.dart';

class LoginScreenView extends StatefulWidget{
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {

  final _emailController = TextEditingController();
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

  _buildBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white, // Màu nền của Container
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(height: 20,),
                TextFormField(
                  controller: _emailController,
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
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreenView(),
                      ));
                    },
                    child: const Text(
                      'Đăng Nhập',
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