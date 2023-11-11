import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/tour_model.dart';

import '../../../model/tin_tuc_moi_model.dart';

class ItemWithTextOverlay extends StatelessWidget {
  const ItemWithTextOverlay({required this.item, Key? key}) : super(key: key);
  final Tour item;

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
              Image.network(
                item.imgs[item.imgs.length-1],
                height: 200,
                width: screenWidth - 60.0,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
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
          left: 40,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Tour: " + item.ten,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Màu của văn bản
                ),
                overflow: TextOverflow.ellipsis, // Hiển thị ba dấu chấm khi văn bản tràn ra ngoài
                maxLines: 2, // Số dòng tối đa để hiển thị
              ),
              SizedBox(height: 10,),
              Text(
                'Giá: ${Tour.formatToVietnameseMoney(item.gia)} VNĐ',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Màu của văn bản
                ),
                overflow: TextOverflow.ellipsis, // Hiển thị ba dấu chấm khi văn bản tràn ra ngoài
                maxLines: 2, // Số dòng tối đa để hiển thị
              ),
              SizedBox(height: 10,),
              Text(
                "Mô tả: "+item.moTa,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white, // Màu của văn bản
                ),
                overflow: TextOverflow.ellipsis, // Hiển thị ba dấu chấm khi văn bản tràn ra ngoài
                maxLines: 3, // Số dòng tối đa để hiển thị
              ),
            ],
          ),
        ),
      ],
    );
  }
}
