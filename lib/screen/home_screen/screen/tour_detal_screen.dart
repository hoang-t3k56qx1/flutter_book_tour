import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/tour_model.dart';

import 'book_tour_screen.dart';
import 'img_tour_detal.dart';

class TourDetalScreen extends StatelessWidget{
  const TourDetalScreen({super.key, required this.tour});
  final Tour tour;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[20],
      appBar: AppBar(
        title:  const Center(child: Text("Xem chi tiết           ")),
      ),
      body:  SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        primary: true,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
               Center(
                  child: Text(
                      tour.ten,
                      style: const TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                  )
              ),
              const SizedBox(height: 15,),
              ImgTourDetalView(featuredImages: tour.imgs,),
              const SizedBox(height: 5,),
              lineText("Mô tả", tour.moTa, context),
              const SizedBox(height: 5,),
              lineText("Thời gian", tour.thoiGian, context),
              const SizedBox(height: 5,),
              lineText("Lịch trình", tour.lichTrinh, context),
              const SizedBox(height: 5,),
              lineText("Địa điểm", "${tour.diaDanh.ten} - ${tour.diaDanh.moTa}", context),
              const SizedBox(height: 5,),
              lineText("Giá", "${Tour.formatToVietnameseMoney(tour.gia)} VNĐ", context),
              const SizedBox(height: 15,),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  BookTourScreen(tour: tour,),
                  ));
                },
                child: Center(
                  child: Container(
                    width: 130,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ĐẶT TOUR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget lineText(String lab, String content, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${lab}: ",
            style: const TextStyle(
              color: Colors.black,
                fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            width: screenWidth - 60,
            child: Text(
              content,
              maxLines: 10,
              style: const TextStyle(
                  fontSize: 16
              ),
            ),
          ),
        ],
      ),
    );
  }

}