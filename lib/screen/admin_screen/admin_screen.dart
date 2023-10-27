import 'package:flutter/material.dart';
import 'package:flutter_book_tour/screen/admin_screen/update_tour_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../assets_manager.dart';
import '../../model/tour_model.dart';
import '../../provider/tour_provide.dart';
import '../home_screen/screen/book_tour_screen.dart';
import '../home_screen/screen/home_screen_view.dart';
import '../home_screen/screen/item_tour_view.dart';
import '../home_screen/screen/tour_detal_screen.dart';
import '../logout_screen/logout_screen.dart';
import '../notifi_screen/notifi_screen.dart';

class AdminScreenView extends StatefulWidget{
  const AdminScreenView({super.key});

  @override
  State<AdminScreenView> createState() => _AdminScreenViewState();
}

class _AdminScreenViewState extends State<AdminScreenView> {

  List<Tour> listTour = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20,),
          Center(
            child: ElevatedButton(
                onPressed: () {

                },
                child: const Text(
                  "Thêm mới tour"
                ),
            ),
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
          const SizedBox(height: 15,),
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
            },
            onChiTiet: (tour) {
            },
            onCapNhap: (tour) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  UpdateTourScreen(tour: tour,),
              ));
            },
            onXoa: (tour) {
              showLogoutDialog(context, tour);
            },
            typeHome: false,
          );
        },
      ) : ShowThongBao.show("nodata");
    }
    if (state.status == ListTourState.failure) {
      return ShowThongBao.show("failure");
    }
    return ShowThongBao.show("failure");
  }

  void showLogoutDialog(BuildContext context, Tour item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác Nhận Xóa'),
          content: Text('Bạn có chắc chắn muốn xóa tour ${item.ten}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                // call api xóa và tải lại dữ liệu
                Navigator.of(context).pop();
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }
}