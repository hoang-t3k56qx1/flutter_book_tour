import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaverScreen extends StatelessWidget{
  const SaverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF0561FB), Color(0xFF042968)],
            ),
          ),
          child:
             Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 30,),
              const Text(
                'ĐẶT TOUR DU LỊCH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.76,
                  fontFamily: 'Barlow Condensed',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 1.60,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}