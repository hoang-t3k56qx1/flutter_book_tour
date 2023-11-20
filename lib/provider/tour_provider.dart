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

  TourState stateNoiBat = const TourState();

  TourState stateDelete = const TourState();

  TourState stateCreate = const TourState();

  TourState stateUpdate = const TourState();


  Future<void> listTour(String key) async {
    state = state.copyWith(status: ListTourState.loading);
    notifyListeners();
    try {
      final response = await tourService.listTourByName(key);
      if (response.data != null) {
        List<dynamic> list = response.data;
        List<Tour> tours = list.map((e) => Tour.fromJson(e)).toList();
        print(tours);
        state = state.copyWith(status: ListTourState.success, tours: tours);
      }
    } catch(e) {
      print(e.toString());
      state = state.copyWith(status: ListTourState.failure);
    }
    notifyListeners();
  }

  Future<void> listTourNoiBat() async {
    if (stateNoiBat.tours.isNotEmpty) {
      stateNoiBat = state.copyWith(status: ListTourState.success);
      notifyListeners();
    }
    stateNoiBat = state.copyWith(status: ListTourState.loading);
    notifyListeners();
    try {
      final response = await tourService.listTour();
      if (response.data != null) {
        List<dynamic> list = response.data;
        List<Tour> tours = list.map((e) => Tour.fromJson(e)).toList();
        List<Tour> lists = tours.sublist(tours.length - 3);

        stateNoiBat = state.copyWith(status: ListTourState.success, tours: lists);
      }
    } catch(e) {
      print(e.toString());
      stateNoiBat = state.copyWith(status: ListTourState.failure);
    }
    notifyListeners();
  }

  Future<void> deleteTour(int id) async {
    stateDelete = state.copyWith(status: ListTourState.loading);
    try {
      final response = await tourService.deleteTour(id);
      print(response.data);
      if (response.data == "Xóa thành công"){
        stateDelete = state.copyWith(status: ListTourState.success);
        notifyListeners();
      } else {
        stateDelete = state.copyWith(status: ListTourState.failure);
        notifyListeners();
      }

    } catch(e) {
      print(e.toString());
      stateDelete = state.copyWith(status: ListTourState.failure);
      notifyListeners();
    }
  }

  Future<void> createTour(Tour tour) async {
    stateCreate = state.copyWith(status: ListTourState.loading);
    notifyListeners();
    try {
      final response = await tourService.createTour(tour);
      if (response.data != null) {
        stateCreate = state.copyWith(status: ListTourState.success);
      } else {
        stateCreate = state.copyWith(status: ListTourState.failure);
      }
    } catch(e) {
      print(e.toString());
      stateCreate = state.copyWith(status: ListTourState.failure);
    }
    notifyListeners();
  }

  Future<void> updateTour(Tour tour) async {
    stateUpdate = state.copyWith(status: ListTourState.loading);
    notifyListeners();
    try {
      final response = await tourService.updateTour(tour);
      if (response.data != null) {
        stateUpdate = state.copyWith(status: ListTourState.success);
      } else {
        stateUpdate = state.copyWith(status: ListTourState.failure);
      }
    } catch(e) {
      print(e.toString());
      stateUpdate = state.copyWith(status: ListTourState.failure);
    }
    notifyListeners();
  }

}