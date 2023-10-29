import 'package:flutter/material.dart';
import 'package:flutter_book_tour/provider/tour_provide.dart';
import 'package:flutter_book_tour/provider/user_provide.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/home_screen_view.dart';
import 'package:flutter_book_tour/screen/login_screen/login_screen_view.dart';
import 'package:flutter_book_tour/screen/notifi_screen/saver_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TourProvide()),
        ChangeNotifierProvider(create: (context) => UserProvide()),
        // Thêm các Provider khác nếu cần
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomeScreenView(),
      debugShowCheckedModeBanner: false,
    );
  }

}


