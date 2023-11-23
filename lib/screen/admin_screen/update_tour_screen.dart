import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/diadanh_model.dart';
import 'package:flutter_book_tour/model/tour_model.dart';
import 'package:flutter_book_tour/screen/admin_screen/text_area_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../provider/diadanh_provide.dart';
import '../../provider/tour_provider.dart';
import '../../provider/user_provider.dart';
import '../notifi_screen/notifi_screen.dart';

class UpdateTourScreen extends StatefulWidget {
  const UpdateTourScreen({super.key, required this.tour, required this.type});

  final Tour? tour;
  final String type;

  @override
  State<UpdateTourScreen> createState() => _UpdateTourScreenState();
}

class _UpdateTourScreenState extends State<UpdateTourScreen> {
  String type = "UPDATE";
  final _tenController = TextEditingController();
  final _moTaController = TextEditingController();
  final _thoiGianController = TextEditingController();
  final _lichTrinhController = TextEditingController();
  final _hinhAnhController = TextEditingController();
  final _diaDiemController = TextEditingController();
  final _giaController = TextEditingController();
  late String title = "";
  late String diaDiem = "Thanh Hóa";
  List<String> listDiaDanh = [];
  List<DiaDanh> list = [];
  int idDiaDanh = 1;

  @override
  void initState() {
    list =  context.read<DiaDanhProvide>().list;
    type = widget.type;
    _tenController.text = (type == "UPDATE") ? widget.tour!.ten : "";
    _moTaController.text = (type == "UPDATE") ? widget.tour!.moTa : "";
    _thoiGianController.text = (type == "UPDATE") ? widget.tour!.thoiGian : "";
    _lichTrinhController.text =
        (type == "UPDATE") ? widget.tour!.lichTrinh : "";
    _hinhAnhController.text =
        (type == "UPDATE") ? widget.tour!.imgs.join(",") : "";
    _diaDiemController.text = (type == "UPDATE")
        ? widget.tour!.diaDanh.moTa
        : "";
    _giaController.text =
        (type == "UPDATE") ? widget.tour!.gia.toString() : "0";
    if (type == "UPDATE") {
      title = "Cập nhập tour";
    } else {
      title = "Thêm mới tour";
    }
    list.forEach((element) {
      listDiaDanh.add(element.ten);
    });
    if (type == "UPDATE") {
      int index = list.indexWhere((element) => element.id == widget.tour?.diaDanh.id);
      if (index != -1) {
        diaDiem = widget.tour?.diaDanh.ten ?? '';
        idDiaDanh = list[index].id;
      }
    } else {
      diaDiem = "Thanh Hóa";
    }
  }

  Future<void> data() async {
    final provider = context.read<TourProvide>();
    await provider.listTour("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[20],
      appBar: AppBar(
        title: Center(child: Text("$title           ")),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        primary: true,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Center(
              //     child: Text(
              //   widget.tour.ten,
              //   style: const TextStyle(
              //       color: Colors.lightBlue,
              //       fontWeight: FontWeight.w600,
              //       fontSize: 20),
              // )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tên:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 125,
                        child: Text(
                          _tenController.text,
                          maxLines: 10,
                          softWrap: true,
                          // Mặc định là true, nhưng nếu bạn muốn chắc chắn, hãy thiết lập nó ở đây.
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      TextAreaBottomSheet.show(
                        title: 'Nhập mô tả',
                        context: context,
                        text: _tenController.text,
                        maxLength: 500,
                        onFinish: (content) {
                          _tenController.text = content;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // ImgTourDetalView(featuredImages: tour.imgs,),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mô tả:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 125,
                        child: Text(
                          _moTaController.text,
                          maxLines: 10,
                          softWrap: true,
                          // Mặc định là true, nhưng nếu bạn muốn chắc chắn, hãy thiết lập nó ở đây.
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      TextAreaBottomSheet.show(
                        title: 'Nhập mô tả',
                        context: context,
                        text: _moTaController.text,
                        maxLength: 500,
                        onFinish: (content) {
                          _moTaController.text = content;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Thời gian:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 151,
                        child: Text(
                          _thoiGianController.text,
                          maxLines: 10,
                          softWrap: true,
                          // Mặc định là true, nhưng nếu bạn muốn chắc chắn, hãy thiết lập nó ở đây.
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      TextAreaBottomSheet.show(
                        title: 'Nhập thời gian',
                        context: context,
                        text: _thoiGianController.text,
                        maxLength: 500,
                        onFinish: (content) {
                          _thoiGianController.text = content;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lịch trình:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 152,
                        child: Text(
                          _lichTrinhController.text,
                          maxLines: 10,
                          softWrap: true,
                          // Mặc định là true, nhưng nếu bạn muốn chắc chắn, hãy thiết lập nó ở đây.
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      TextAreaBottomSheet.show(
                        title: 'Nhập lịch trình',
                        context: context,
                        text: _lichTrinhController.text,
                        maxLength: 500,
                        onFinish: (content) {
                          _lichTrinhController.text = content;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hình ảnh:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 152,
                        child: Text(
                          _hinhAnhController.text,
                          maxLines: 10,
                          softWrap: true,
                          // Mặc định là true, nhưng nếu bạn muốn chắc chắn, hãy thiết lập nó ở đây.
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      TextAreaBottomSheet.show(
                        title: 'Nhập link hình ảnh',
                        context: context,
                        text: _hinhAnhController.text,
                        maxLength: 500,
                        onFinish: (content) {
                          _hinhAnhController.text = content;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // lineText(
              //     "Địa điểm",
              //     "${widget.tour.diaDanh.ten} - ${widget.tour.diaDanh.moTa}",
              //     context),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Địa điểm:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              _diaDiemController.text,
                              maxLines: 10,
                              softWrap: true,
                              // Mặc định là true, nhưng nếu bạn muốn chắc chắn, hãy thiết lập nó ở đây.
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          DropdownButton<String>(
                            value: diaDiem,
                            onChanged: (String? newValue) {
                              // Xử lý khi một mục được chọn
                             setState(() {
                               diaDiem = newValue ?? diaDiem;
                               int index = list.indexWhere((element) => element.ten == diaDiem);
                               if (index != -1) {
                                 idDiaDanh = list[index].id;
                                 _diaDiemController.text = list[index].moTa;
                               }
                             });
                            },
                            items: listDiaDanh
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Giá:  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 125,
                        child: Text(
                          '${Tour.formatToVietnameseMoney(double.parse(_giaController.text))} VNĐ',
                          maxLines: 10,
                          softWrap: true,
                          // Mặc định là true, nhưng nếu bạn muốn chắc chắn, hãy thiết lập nó ở đây.
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      TextAreaBottomSheet.show(
                        title: 'giá',
                        context: context,
                        text: _giaController.text,
                        maxLength: 500,
                        onFinish: (content) {
                          _giaController.text = content;
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  String vadidate = validate();
                  if (vadidate.isNotEmpty) {
                    showNotifi(context, vadidate);
                  } else {
                    showLogoutDialog(context);
                  }
                },
                child: Center(
                  child: Container(
                    width: 130,
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF036BCB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          (type == "UPDATE") ? 'Cập nhập' : 'Thêm mới',
                          style: const TextStyle(
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

  String validate() {
    String vali = "";
    if (_tenController.text.isEmpty) {
      vali += " \nKhông được để trống tên tour";
    }
    if (_moTaController.text.isEmpty) {
      vali += " \nKhông được để trống mô tả tour";
    }
    if (_thoiGianController.text.isEmpty) {
      vali += " \nKhông được để trống thời gian tour";
    }
    if (_lichTrinhController.text.isEmpty) {
      vali += " \nKhông được để trống lịch trình tour";
    }
    if (_giaController.text.isEmpty) {
      vali += " \nKhông được để trống gia tour";
    }
    return vali.trim();
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text((type == "UPDATE") ? 'CẬP NHẬP' : 'THÊM MỚI'),
          content: Text((type == "UPDATE")
              ? 'Bạn có chắc chắn muốn cập nhập tour này ?'
              : 'Bạn có chắc chắn muốn thêm  tour này ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                List<String> listStringHinhAnh =
                    _hinhAnhController.text.split(',');
                Tour tour = Tour(
                    id: widget.tour?.id ?? 0,
                    ten: _tenController.text,
                    moTa: _moTaController.text,
                    gia: double.parse(_giaController.text),
                    thoiGian: _thoiGianController.text,
                    diaDanh: DiaDanh(id: idDiaDanh, ten: "ten", moTa: "moTa"),
                    lichTrinh: _lichTrinhController.text,
                    imgs: listStringHinhAnh);

                final provider = context.read<TourProvide>();
                if (type == "UPDATE") {
                  await provider.updateTour(tour);
                } else {
                  await provider.createTour(tour);
                }
                final state = (type == "UPDATE")
                    // ignore: use_build_context_synchronously
                    ? context.read<TourProvide>().stateUpdate
                    // ignore: use_build_context_synchronously
                    : context.read<TourProvide>().stateCreate;
                if (state.status == Status.loading) {
                  ShowThongBao.show("loading");
                }
                if (state.status == Status.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text((type == "UPDATE")
                          ? 'Cập nhập tour thành công!'
                          : 'Thêm mới tour thanh công!'),
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
                  // await data();
                }
                if (state.status == Status.failure) {
                  ShowThongBao.show("failure");
                }
                ShowThongBao.show("failure");
              },
              child: Text((type == "UPDATE") ? 'Cập nhập' : 'Thêm mới'),
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
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            width: screenWidth - 60,
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

  @override
  void dispose() {
    _tenController.dispose();
    _moTaController.dispose();
    _thoiGianController.dispose();
    _lichTrinhController.dispose();
    _hinhAnhController.dispose();
    _diaDiemController.dispose();
    _giaController.dispose();
  }
}
