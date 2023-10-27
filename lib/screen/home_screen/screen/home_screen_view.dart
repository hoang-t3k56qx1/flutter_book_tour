import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_book_tour/screen/admin_screen/admin_screen.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/home_view.dart';

import '../../login_screen/login_screen_view.dart';
import 'infor_screen.dart';
import 'infor_screen_view.dart';



class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  late User user = User(
      uid: 1,
      username: "admin",
      password: "123",
      name: "Lê Huy Hoàng",
      email: "lehuyhoangt3@gmail.com",
      avt: "https://scontent.fhan20-1.fna.fbcdn.net/v/t1.15752-9/393465944_291669270480464_6561957402276023511_n.png?_nc_cat=109&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=Oy7jtwMOPToAX8hpXRo&_nc_ht=scontent.fhan20-1.fna&oh=03_AdTBOYWBWzKeV280Belcf7fw0tPH49stdASSkgRCvNCdAg&oe=6554A889"
  );

  @override
  Widget build(BuildContext context) {

    List<String> tab = [
      "Trang chủ",
      (user.username == "admin") ? "Admin" : "Đơn đặt",
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

          (user.username == "admin") ?
          AdminScreenView() : const Center(
            child: Text('Page 2'),
          ),

          // AdminScreenView(),

          PersonalInfoScreenView(user: user,),
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
          (user.username == "admin") ?
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
    super.dispose();
  }

}
