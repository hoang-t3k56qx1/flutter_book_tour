import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/dondat_model.dart';
import 'package:flutter_book_tour/model/tour_model.dart';
import 'package:flutter_book_tour/provider/dondat_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/user_model.dart';
import '../../../provider/user_provider.dart';
import '../../notifi_screen/notifi_screen.dart';
import 'img_tour_detal.dart';

class BookTourScreen extends StatefulWidget {
  const BookTourScreen({super.key, required this.tour});

  final Tour tour;

  @override
  State<BookTourScreen> createState() => _BookTourScreenState();
}

class _BookTourScreenState extends State<BookTourScreen> {
  late int soluong = 5;
  late String startDate = "16/10/2023";
  late String endDate = "18/10/2023";
  late User user = User();
  late bool checkLogin = false;
  SharedPreferences? sharedPreferences;

  Future<void> loadUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    checkLogin = sharedPreferences!.getBool("checkLogin") ?? false;
    String? jsonUser = sharedPreferences!.getString("user") ?? "{}";
    // final newUser = User.fromJson(jsonDecode(jsonUser!));
    print(checkLogin);
    if(checkLogin) {
      try {
        user = User.fromJson(jsonDecode(jsonUser));
      } catch(e) {
        print(e);
      }
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        loadUser();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[20],
        appBar: AppBar(
          title: const Center(child: Text("Đặt tour           ")),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lineText("Tên", widget.tour.ten, context),
              const SizedBox(
                height: 5,
              ),
              lineText("Thời gian", widget.tour.thoiGian, context),
              const SizedBox(
                height: 5,
              ),
              lineText("Lịch trình", widget.tour.lichTrinh, context),
              const SizedBox(
                height: 5,
              ),
              lineText(
                  "Giá",
                  "${Tour.formatToVietnameseMoney(widget.tour.gia)} VNĐ",
                  context),
              const SizedBox(
                height: 5,
              ),
              lineText("Ngày bắt đầu", startDate, context),
              const SizedBox(
                height: 5,
              ),
              lineText("Ngày kết thúc", endDate, context),
              const SizedBox(
                height: 5,
              ),
              lineText("Số lượng", "$soluong", context),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Tổng tiền: ",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Text(
                        "${Tour.formatToVietnameseMoney(widget.tour.gia * soluong)} VNĐ",
                        maxLines: 10,
                        style:
                            const TextStyle(color: Colors.orange, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showDialogXacNhan(context);
                },
                child: Center(
                  child: Container(
                    width: 135,
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
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
              ),
            ],
          ),
        ));
  }

  Widget lineText(String lab, String content, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${lab}: ",
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            child: Text(
              content,
              maxLines: 10,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void showDialogXacNhan(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác Nhận Đặt tour'),
          content: Text(
              'Tổng số tiền bạn cần thanh toán cho tour khi đến nơi nhận là: '
              '${Tour.formatToVietnameseMoney(widget.tour.gia * soluong)} VNĐ'),
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
                    Provider.of<DonDatProvide>(context, listen: false);
                DateTime dateNow = DateTime.now();
                DonDat donDat = DonDat(
                    id: 0,
                    user: user,
                    tour: widget.tour,
                    soLuong: soluong,
                    ngayDat: DateFormat('dd/MM/yyyy').format(dateNow),
                    ngayBatDau: startDate,
                    ngayKetThuc: endDate,
                    tongTien: (widget.tour.gia * soluong));
                await provider.saveDonDat(donDat);
                final state = provider.status;
                if (state == Status.loading) {
                  ShowThongBao.show("loading");
                }
                if (state == Status.success) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Đặt tour thành công'),
                      backgroundColor: Colors.lightBlue,
                      // Đặt màu nền thành màu xanh
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Đóng',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                  Navigator.of(context).pop();
                }

                if (state == Status.failure) {
                  ShowThongBao.show("failure");
                }
                  ShowThongBao.show("failure");
              },
              child: const Text('Đặt'),
            ),
          ],
        );
      },
    );
  }
}
