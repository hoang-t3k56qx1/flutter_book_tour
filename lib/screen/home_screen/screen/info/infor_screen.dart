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
                  : "https://scontent-hkg4-1.xx.fbcdn.net/v/t39.30808-6/374575380_1926685071044145_3041714391982645797_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFLzjWsw0sK2TBfrUpHpxCfwkxYK_Hi4pbCTFgr8eLiljvEywYNTVwlgu5W2E-vRkaJJw0hr5xoLhiBwH2aHJUy&_nc_ohc=e672M_bWM1oAX-TLDCj&_nc_ht=scontent-hkg4-1.xx&oh=00_AfDjG3afSXjErYTeAyDgIQVWXHzH5OYUvfVOAcRLS2sITw&oe=6564FFA1",
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
