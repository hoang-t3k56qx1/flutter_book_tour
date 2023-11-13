import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/user_model.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets_manager.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.network(
              (user.username == 'admin')
                  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt6C5if4pCpIkPgrDk3eFzHsL2dl9S2SlS5Q&usqp=CAU"
                  : "https://scontent.fhan20-1.fna.fbcdn.net/v/t1.15752-9/393465944_291669270480464_6561957402276023511_n.png?_nc_cat=109&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=Oy7jtwMOPToAX8hpXRo&_nc_ht=scontent.fhan20-1.fna&oh=03_AdTBOYWBWzKeV280Belcf7fw0tPH49stdASSkgRCvNCdAg&oe=6554A889",
              width: 160.0,
              height: 160.0,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(ImageAssets.avatar);
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
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
