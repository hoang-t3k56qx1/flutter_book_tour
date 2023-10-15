import 'diadanh_model.dart';

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
