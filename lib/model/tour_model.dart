import 'diadanh_model.dart';
import 'package:intl/intl.dart';


class Tour {
  final int id;
  final String ten;
  final String moTa;
  final double gia;
  final String thoiGian;
  final DiaDanh diaDanh;
  final String lichTrinh;
  final List<String> imgs;

  Tour({
    required this.id,
    required this.ten,
    required this.moTa,
    required this.gia,
    required this.thoiGian,
    required this.diaDanh,
    required this.lichTrinh,
    required this.imgs,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    List<String> imageList = (json['imgs'] as String).split(',');
    return Tour(
      id: json['id'],
      ten: json['ten'],
      moTa: json['moTa'],
      gia: json['gia'].toDouble(),
      thoiGian: json['thoiGian'],
      diaDanh: DiaDanh.fromJson(json['diaDanh']),
      lichTrinh: json['lichTrinh'],
      imgs: imageList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ten': ten,
      'moTa': moTa,
      'gia': gia,
      'thoiGian': thoiGian,
      'diaDanh': diaDanh.toJson(), // Sử dụng phương thức toJson của DiaDanh
      'lichTrinh': lichTrinh,
      'imgs': imgs.join(','), // Chuyển danh sách thành chuỗi
    };
  }

  static String formatToVietnameseMoney(double amount) {
    if (amount < 0) {
      return "Số tiền không hợp lệ";
    }

    final NumberFormat formatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '',
      decimalDigits: 0,
    );

    return formatter.format(amount);
  }

  static List<Tour> listTourNoiBat(){
    return [
    Tour(
      id: 1,
      ten: "Sầm Sơn",
      moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
      gia: 1500000.0,
      thoiGian: "2 ngày 1 đêm",
      diaDanh: DiaDanh(
        id: 1,
        ten: "Thanh Hóa",
        moTa:
        "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
      ),
      lichTrinh: "Hà Nội - Thanh Hóa",
      imgs: [
        "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        "https://danatravel.vn/data/images/8105-808a-4dd4-9da5-9883aa6b9d9f.jpg",
        "https://cattour.vn/images/upload/images/Du-lich-sam-son/%C4%91%E1%BB%8Ba%20%C4%91i%E1%BB%83m%20du%20l%E1%BB%8Bch%20s%E1%BA%A7m%20s%C6%A1n%20thanh%20h%C3%B3a/bien1.png",
        "https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/biensamson.jpg",
      ],
    ),
    Tour(
    id: 1,
    ten: "Sầm Sơn",
    moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
    gia: 1500000.0,
    thoiGian: "2 ngày 1 đêm",
    diaDanh: DiaDanh(
    id: 1,
    ten: "Thanh Hóa",
    moTa:
    "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
    ),
    lichTrinh: "Hà Nội - Thanh Hóa",
    imgs: [
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    ],
    ),
    Tour(
    id: 1,
    ten: "Sầm Sơn",
    moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
    gia: 1500000.0,
    thoiGian: "2 ngày 1 đêm",
    diaDanh: DiaDanh(
    id: 1,
    ten: "Thanh Hóa",
    moTa:
    "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
    ),
    lichTrinh: "Hà Nội - Thanh Hóa",
    imgs: [
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
    ],),];
  }


  static List<Tour> listTour(){
    return [
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://danatravel.vn/data/images/8105-808a-4dd4-9da5-9883aa6b9d9f.jpg",
          "https://cattour.vn/images/upload/images/Du-lich-sam-son/%C4%91%E1%BB%8Ba%20%C4%91i%E1%BB%83m%20du%20l%E1%BB%8Bch%20s%E1%BA%A7m%20s%C6%A1n%20thanh%20h%C3%B3a/bien1.png",
          "https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/biensamson.jpg",
          ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
      Tour(
        id: 1,
        ten: "Sầm Sơn",
        moTa: "Đây là mô tả dài về tour mẫu có độ dài tối đa 1.000.000 ký tự...",
        gia: 1500000.0,
        thoiGian: "2 ngày 1 đêm",
        diaDanh: DiaDanh(
          id: 1,
          ten: "Thanh Hóa",
          moTa:
          "Thanh Hoá ở Bắc Trung Bộ, điểm cực Bắc của Thanh Hoá cách thủ đô Hà Nội 150 km. Phía Tây Thanh Hóa giáp nước Cộng hòa dân chủ nhân dân Lào, với chiều dài đường biên giới 192 km chạy qua những vùng núi cao hiểm trở.",
        ),
        lichTrinh: "Hà Nội - Thanh Hóa",
        imgs: [
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
          "https://statics.vinpearl.com/Anh%201%20Du%20lich%20sam%20son%20thanh%20hoa.jpg",
        ],
      ),
    ];
  }
}
