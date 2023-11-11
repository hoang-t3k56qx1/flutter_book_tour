import 'package:flutter/material.dart';
import 'package:flutter_book_tour/provider/dondat_provider.dart';
import 'package:flutter_book_tour/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../../model/dondat_model.dart';
import '../../../../model/user_model.dart';
import '../../../notifi_screen/notifi_screen.dart';
import 'dondat_view.dart';

class DonDatByUser extends StatefulWidget{
  const DonDatByUser({super.key,required this.user});
  final User user;
  @override
  State<DonDatByUser> createState() => _DonDatByUserState();
}

class _DonDatByUserState extends State<DonDatByUser> with AutomaticKeepAliveClientMixin {
  late List<DonDat> listDonDat = [];

  @override
  void initState() {
    super.initState();
    data();
  }

  Future<void> data() async {
    await context.read<DonDatProvide>().listDonDatById(widget.user.uid);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 15,),
          const Center(
            child: Text(
              "DANH SÁCH TOUR ĐÃ ĐẶT",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          const SizedBox(height: 10,),
          _buidListDonDatByUser(),
        ],
      ),
    );
  }

  Widget _buidListDonDatByUser(){
    final provider = Provider.of<DonDatProvide>(context, listen: false);
    final state = provider.statusDonDatById;
    if(state == Status.loading) {
      return ShowThongBao.show("loading");
    }
    if(state == Status.success) {
      listDonDat = provider.list;
      listDonDat = listDonDat.reversed.toList();
      return (listDonDat.isNotEmpty) ?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "    Tổng tour đã đặt: ${listDonDat.length}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF082455),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10,),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listDonDat.length,
            itemBuilder: (context, index) {
              DonDat donDat = listDonDat[index];
              return ItemDonDatView(donDat: donDat,);
            },
          ),
        ],
      ) : ShowThongBao.show("nodata");
    }
    if (state == Status.failure) {
      return ShowThongBao.show("failure");
    }
    if (state == Status.nodata) {
      return ShowThongBao.show("nodata");
    }
    return ShowThongBao.show("nodata");
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}