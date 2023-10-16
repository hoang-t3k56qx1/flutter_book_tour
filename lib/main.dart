import 'package:flutter/material.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/home_screen_view.dart';
import 'package:flutter_book_tour/screen/login_screen/login_screen_view.dart';
import 'package:flutter_book_tour/screen/saver_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      home: HomeScreenView(),
      debugShowCheckedModeBanner: false,
    );
  }

}


