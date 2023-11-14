import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/tour_model.dart';
import 'package:flutter_book_tour/screen/admin_screen/text_area_bottom_sheet.dart';

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

  @override
  void initState() {
    type = widget.type;
    _tenController.text = (type == "UPDATE") ? widget.tour!.ten : "Nhập tên";
    _moTaController.text = (type == "UPDATE") ? widget.tour!.moTa : "Nhập mô tả";
    _thoiGianController.text =
        (type == "UPDATE") ? widget.tour!.thoiGian : "Nhập thời gian";
    _lichTrinhController.text =
        (type == "UPDATE") ? widget.tour!.lichTrinh : "Nhập lịch trình";
    _hinhAnhController.text =
        (type == "UPDATE") ? widget.tour!.imgs.join(",") : "Nhập link hình ảnh";
    _diaDiemController.text = (type == "UPDATE")
        ? "${widget.tour!.diaDanh.ten} - ${widget.tour!.diaDanh.moTa}"
        : "Chọn địa điểm";
    _giaController.text = (type == "UPDATE")
        ? "${Tour.formatToVietnameseMoney(widget.tour!.gia)} VNĐ"
        : "Nhập giá";
    if (type == "UPDATE") {
      title = "Cập nhập tour";
    } else {
      title = "Thêm mới tour";
    }
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
                  Row(
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
                      Container(
                        width: MediaQuery.of(context).size.width - 148,
                        child: Text(
                          _diaDiemController.text,
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
                    onPressed: () {},
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
                          _giaController.text,
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
                  showLogoutDialog(context);
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
              onPressed: () {
                // call api cập nhập  và tải lại dữ liệu
                Navigator.of(context).pop();
              },
              child: Text((type == "UPDATE") ? 'Cập nhập' : 'Thêm mới'),
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
