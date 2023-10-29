import 'package:flutter/material.dart';
import 'package:flutter_book_tour/screen/admin_screen/admin_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../assets_manager.dart';
import '../../provider/user_provide.dart';
import '../home_screen/screen/home_screen_view.dart';
import '../logout_screen/logout_screen.dart';
import 'login_body.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvide()),
        ],
        child: Scaffold(
          backgroundColor: const Color(0xFF0561FB),
          body: LoginBody(),
        ),
    );
  }
}
