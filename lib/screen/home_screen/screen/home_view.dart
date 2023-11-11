import 'package:flutter/material.dart';
import 'package:flutter_book_tour/provider/tour_provider.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/tin_tuc_view.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/tour_detal_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../assets_manager.dart';
import '../../../model/tour_model.dart';
import '../../notifi_screen/notifi_screen.dart';
import 'book_tour_screen.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      dataTour();
       // setState(() {
       //   dataTour();
       // });
    });
  }

  Future<void> dataTour() async {
    await context.read<TourProvide>().listTour();
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
            featuredImages: Tour.listTourNoiBat(),
            onTap: (Tour tour) {
            // click tour noi bat
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  TourDetalScreen(tour: tour,),
              ));
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
          _buidListTour(),
        ],
      ),
    );
  }

  Widget _buidListTour(){
    final state = Provider.of<TourProvide>(context).state;

    if(state.status == ListTourState.loading) {
      return ShowThongBao.show("loading");
    }
      if(state.status == ListTourState.success) {
      listTour = state.tours;
      return (listTour.isNotEmpty) ?
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listTour.length,
        itemBuilder: (context, index) {
          Tour tour = listTour[index];
          return ItemTourView(
            tour: tour,
            onDatTour: (tour) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  BookTourScreen(tour: tour,),
              ));
            },
            onChiTiet: (tour) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  TourDetalScreen(tour: tour,),
              ));
            },
            onCapNhap: (value) {

            },
            onXoa: (value) {

            },
            typeHome: true,
          );
        },
      ) : ShowThongBao.show("nodata");
    }
    if (state.status == ListTourState.failure) {
      return ShowThongBao.show("failure");
    }
    return ShowThongBao.show("failure");
  }
}