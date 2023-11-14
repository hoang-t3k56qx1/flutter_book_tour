import 'package:flutter/material.dart';
import 'package:flutter_book_tour/screen/admin_screen/update_tour_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../assets_manager.dart';
import '../../model/tour_model.dart';
import '../../provider/tour_provider.dart';
import '../home_screen/screen/home/book_tour_screen.dart';
import '../home_screen/screen/home_screen_view.dart';
import '../home_screen/screen/home/item_tour_view.dart';
import '../home_screen/screen/home/tour_detal_screen.dart';
import '../logout_screen/logout_screen.dart';
import '../notifi_screen/notifi_screen.dart';

class AdminScreenView extends StatefulWidget {
  const AdminScreenView({super.key});

  @override
  State<AdminScreenView> createState() => _AdminScreenViewState();
}

class _AdminScreenViewState extends State<AdminScreenView> {
  List<Tour> listTour = [];

  Future<void> data() async {
    final provider = context.read<TourProvide>();
    await provider.listTour("");
    setState(() {

    });
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
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UpdateTourScreen(
                    tour: null,
                    type: "CREATE",
                  ),
                ));
              },
              child: const Text("Thêm mới tour"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "DANH SÁCH TOUR",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _buidListTour(),
        ],
      ),
    );
  }

  Widget _buidListTour() {
    final provider = Provider.of<TourProvide>(context, listen: false);
    final state = provider.state;

    if (state.status == ListTourState.loading) {
      return ShowThongBao.show("loading");
    }
    if (state.status == ListTourState.success) {
      listTour = state.tours;
      listTour = listTour.reversed.toList();
      return (listTour.isNotEmpty)
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listTour.length,
              itemBuilder: (context, index) {
                Tour tour = listTour[index];
                return ItemTourView(
                  tour: tour,
                  onDatTour: (tour) {},
                  onChiTiet: (tour) {},
                  onCapNhap: (tour) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateTourScreen(
                        tour: tour,
                        type: "UPDATE",
                      ),
                    ));
                  },
                  onXoa: (tour) {
                    showLogoutDialog(context, tour);
                  },
                  typeHome: false,
                );
              },
            )
          : ShowThongBao.show("nodata");
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
              onPressed: () async {
                final provider =
                    Provider.of<TourProvide>(context, listen: false);
                await provider.deleteTour(item.id);
                final stateDelete = provider.stateDelete;

                if (stateDelete.status == ListTourState.loading) {
                  ShowThongBao.show("loading");
                }
                if (stateDelete.status == ListTourState.success) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Xóa tour thành công!'),
                      backgroundColor: Colors.lightBlue,
                      // Đặt màu nền thành màu xanh
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Đóng',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
                if (stateDelete.status == ListTourState.failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Tour không thể xóa vì đã lưu trữ đơn đặt!'),
                      backgroundColor: Colors.red,
                      // Đặt màu nền thành màu xanh
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Đóng',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
                Navigator.pop(context);
                data();
                // call api xóa và tải lại dữ liệu

              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

  void showNotifi(BuildContext context, String mess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
            'Thông báo',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          content: Text(
            mess,
            style: const TextStyle(color: Colors.red),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // call api xóa và tải lại dữ liệu
                Navigator.of(context).pop();
              },
              child: const Center(child: Text('Đóng')),
            ),
          ],
        );
      },
    );
  }
}
