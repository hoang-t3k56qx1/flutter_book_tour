import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/user_model.dart';

import '../../login_screen/login_screen_view.dart';
import 'infor_screen.dart';

class PersonalInfoScreenView extends StatelessWidget {
  const PersonalInfoScreenView({required this.user, super.key, });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PersonalInfoScreen(user: user,),
          const SizedBox(height: 150),
          ElevatedButton(
            onPressed: () {
              showLogoutDialog(context);
            },
            child: const Text('Đăng xuất'),
          ),
        ]
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác Nhận Đăng Xuất'),
          content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreenView(),
                ));
              },
              child: const Text('Đăng Xuất'),
            ),
          ],
        );
      },
    );
  }
}