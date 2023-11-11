import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/dondat_model.dart';
import 'package:flutter_book_tour/model/tour_model.dart';

class ItemDonDatView extends StatelessWidget {
  const ItemDonDatView({
    required this.donDat,
    super.key,
  });

  final DonDat donDat;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Container(
        color: Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              donDat.tour.imgs[0],
              height: 180,
              width: screenWidth,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            _buildThongTin(),
          ],
        ),
      ),
    );
  }

  Widget _buildThongTin() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Tour: ${donDat.tour.ten}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Lịch trình: ${donDat.tour.lichTrinh}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Ngày đặt: ${donDat.ngayDat}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Ngày bắt đầu: ${donDat.ngayBatDau}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Ngày kết thúc: ${donDat.ngayKetThuc}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Số lượng: ${donDat.soLuong}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Giá: ${Tour.formatToVietnameseMoney(donDat.tour.gia)} VNĐ',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Tổng tiền: ${Tour.formatToVietnameseMoney(donDat.tongTien)} VNĐ',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
