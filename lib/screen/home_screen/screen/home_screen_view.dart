import 'package:flutter/material.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/home_view.dart';

import '../../login_screen/login_screen_view.dart';



class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text(tab[_currentIndex])),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children:  [
          const HomeView(),
          Center(
            child: Text('Page 2'),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreenView(),
                ));
              },
              child: const Text('Đăng xuất'),
            ),
          ),
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
            icon: const Icon(Icons.home),
            label: tab[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: tab[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: tab[2],
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

  List<String> tab = [
    "Trang chủ",
    "Lịch sử",
    "Hồ sơ"
  ];
}
