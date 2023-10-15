import 'package:flutter/material.dart';

import '../../../model/tin_tuc_moi_model.dart';

class ItemWithTextOverlay extends StatelessWidget {
  const ItemWithTextOverlay({required this.item, Key? key}) : super(key: key);
  final TinTucItemModel item;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                item.img,
                height: 200,
                width: screenWidth - 60.0,
                fit: BoxFit.cover,
              ),
              Container(
                width: screenWidth - 60.0,
                height: 200,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: FractionalOffset(0.0, 0.5), // Bắt đầu ở dưới cùng (y = 1.0)
                    end: FractionalOffset(0.0, 1),
                    colors: [Color(0x59626262), Colors.black],
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Màu của văn bản
                  ),
                  overflow: TextOverflow.ellipsis, // Hiển thị ba dấu chấm khi văn bản tràn ra ngoài
                  maxLines: 2, // Số dòng tối đa để hiển thị
                ),
              ),
              Center(
                child: Text(
                  item.content,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white, // Màu của văn bản
                  ),
                  overflow: TextOverflow.ellipsis, // Hiển thị ba dấu chấm khi văn bản tràn ra ngoài
                  maxLines: 3, // Số dòng tối đa để hiển thị
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
