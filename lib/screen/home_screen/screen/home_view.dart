

import 'package:flutter/material.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/tin_tuc_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets_manager.dart';
import '../../../model/tour_model.dart';
import 'item_tour_view.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {
  TextEditingController textEditingController = TextEditingController();
  List<Tour> listTour = [];
  @override
  void initState() {
    super.initState();
    listTour = Tour.listTour();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFC8D3E4)),
                  borderRadius: BorderRadius.circular(37),
                ),
              ),
              child: TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Tìm kiếm',
                  border: OutlineInputBorder(
                      borderRadius : BorderRadius.all(Radius.circular(37))
                  ),
                ),
                onChanged: (value) {
                  // tim kiem

                },
              ),
            ),
          ),
          const SizedBox(height: 5,),
          const Center(
            child: Text(
                "TOP TOUR NỔI BẬT",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const SizedBox(height: 10,),
          TinTucView(
            onTap: (int value) {
            // click tour noi bat
              print("hoangdev");
            },
          ),
          const SizedBox(height: 10,),
          const Center(
            child: Text(
              "DANH SÁCH TOUR",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          // const SizedBox(height: 15,),
          (listTour.isNotEmpty) ?
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listTour.length,
            itemBuilder: (context, index) {
              Tour tour = listTour[index];
              return ItemTourView(
                tour: tour,
                onDatTour: (value) {
                  print("ĐẶT TOUR - ${value.ten}");
                },
                onChiTiet: (value) {
                  print("XEM CHI TIẾT TOUR: - ${value.ten}");
                },
              );
            },
          ) :
          Center(
            child: SvgPicture.asset(
              SvgAssets.ic_noData
            ),
          ),
        ],
      ),
    );
  }
}