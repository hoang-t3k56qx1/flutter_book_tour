import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_book_tour/screen/admin_screen/admin_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/tour_provider.dart';
import 'booked/dondat_by_user_screen.dart';
import 'home_view.dart';
import 'info/infor_screen_view.dart';



class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late bool checkLogin = false;
  SharedPreferences? sharedPreferences;


  late User user = User();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    checkLogin = sharedPreferences!.getBool("checkLogin") ?? false;
    String? jsonUser = sharedPreferences!.getString("user") ?? "{}";
    // final newUser = User.fromJson(jsonDecode(jsonUser!));
    print(checkLogin);
    if(checkLogin) {
      try {
        user = User.fromJson(jsonDecode(jsonUser));
      } catch(e) {
        print(e);
      }
    }
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {

    List<String> tab = [
      "Trang chủ",
      (user.username == "admin" && checkLogin) ? "Admin" : "Đơn đặt",
      "Hồ sơ"
    ];

    return Scaffold(
      backgroundColor: Colors.orange[20],
      appBar: AppBar(
        title:  Center(
            child: Text(
                (tab[_currentIndex] == "Admin") ? "Quản lý tour" : tab[_currentIndex],
            )
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children:   [
           const HomeView(),

          (user.username == "admin" && checkLogin) ?
          AdminScreenView() : DonDatByUser(user: user,),
          // AdminScreenView(),

          PersonalInfoScreenView(user: user, checkLogin: checkLogin,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home,),
            label: tab[0],
          ),
          (user.username == "admin" && checkLogin) ?
          BottomNavigationBarItem(
            icon: const Icon(Icons.admin_panel_settings_outlined),
            label: tab[1],
          ) :
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: tab[1],
            //   backgroundColor: Colors.black26
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: tab[2],
            // backgroundColor: Colors.black26
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    // sharedPreferences!.remove('user');
    // sharedPreferences!.remove('checkLogin');
    super.dispose();
  }

}
