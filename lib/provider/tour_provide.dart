import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_book_tour/model/tour_model.dart';
import 'package:flutter_book_tour/service/dio_singleton.dart';

import '../service/tour_service.dart';

enum ListTourState  {initial,loading, success, nodata, failure}

class TourState extends Equatable{
  const TourState({
    this.status  = ListTourState.initial,
    this.tours = const [],
  });

  final ListTourState status;
  final List<Tour> tours;


  @override
  // TODO: implement props
  List<Object?> get props =>  [status, tours];

  TourState copyWith({
    ListTourState? status,
    List<Tour>? tours,
  }){
    return TourState(
      status: status ?? this.status,
      tours: tours ?? this.tours
    );
  }


}

class TourProvide extends ChangeNotifier{

  late TourService tourService = TourService();

  TourState state = const TourState();


  Future<void> listTour() async {
    state = state.copyWith(status: ListTourState.loading);
    notifyListeners();
    try {
      final response = await tourService.listTour();
      if (response.data != null) {
        List<dynamic> list = response.data;
        List<Tour> tours = list.map((e) => Tour.fromJson(e)).toList();
        state = state.copyWith(status: ListTourState.success, tours: tours);
      }
    } catch(e) {
      print(e.toString());
      state = state.copyWith(status: ListTourState.failure);
    }
    notifyListeners();
  }

}