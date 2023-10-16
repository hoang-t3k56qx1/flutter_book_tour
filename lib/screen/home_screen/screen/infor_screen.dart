import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets_manager.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.network(
              user.avt,
              width: 160.0,
              height: 160.0,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                    ImageAssets.avatar
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          user.email,
          style: const TextStyle(
            fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}