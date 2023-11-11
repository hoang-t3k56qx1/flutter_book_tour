import 'package:flutter_book_tour/model/tour_model.dart';
import 'package:flutter_book_tour/model/user_model.dart';

class DonDat {
  final int id;
  final User user;
  final Tour tour;
  final int soLuong;
  final String ngayDat;
  final String ngayBatDau;
  final String ngayKetThuc;
  final double tongTien;

  DonDat({
    required this.id,
    required this.user,
    required this.tour,
    required this.soLuong,
    required this.ngayDat,
    required this.ngayBatDau,
    required this.ngayKetThuc,
    required this.tongTien,
  });

  factory DonDat.fromJson(Map<String, dynamic> json) {
    return DonDat(
      id: json['id'],
      user: User.fromJson(json['user']),
      tour: Tour.fromJson(json['tour']),
      soLuong: json['soLuong'],
      ngayDat: json['ngayDat'],
      ngayBatDau: json['ngayBatDau'],
      ngayKetThuc: json['ngayKetThuc'],
      tongTien: json['tongTien'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(), // Assuming User has a toJson method
      'tour': tour.toJson(), // Assuming Tour has a toJson method
      'soLuong': soLuong,
      'ngayDat': ngayDat,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
      'tongTien': tongTien,
    };
  }
}