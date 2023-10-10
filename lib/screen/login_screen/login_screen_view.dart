import 'package:flutter/material.dart';

import '../home_screen/home_screen_view.dart';

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
      appBar: AppBar(
        title: const Center(child: Text('ĐẶT TOUR DU LỊCH')),
        // toolbarHeight: 80,
        // titleTextStyle: const TextStyle(
        //   fontWeight: FontWeight.w600,
        //   fontSize: 30
        // ),
      ),
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  _buildBody(){
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
      child: Container(
        color: Colors.white,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Đăng nhập",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500
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
              ElevatedButton(
                onPressed: () {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreenView(),
                  ));
                },
                child: const Text('Đăng Nhập'),
              ),
            ],
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