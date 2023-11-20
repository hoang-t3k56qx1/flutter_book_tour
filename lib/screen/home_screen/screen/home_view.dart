import 'package:flutter/material.dart';
import 'package:flutter_book_tour/provider/diadanh_provide.dart';
import 'package:flutter_book_tour/provider/tour_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../assets_manager.dart';
import '../../../model/tour_model.dart';
import '../../notifi_screen/notifi_screen.dart';
import 'home/book_tour_screen.dart';
import 'home/item_tour_view.dart';
import 'home/tin_tuc_view.dart';
import 'home/tour_detal_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dataTour();
    dataDiaDanh();
  }

  Future<void> dataTour() async {
    final provider = context.read<TourProvide>();
    if(provider.stateNoiBat.tours.isEmpty){
      await provider.listTourNoiBat();
    }
    await provider.listTour(textEditingController.text.trim() ?? "");
    setState(() {});
  }

  Future<void> dataDiaDanh() async {
    final provider = context.read<DiaDanhProvide>();
    await provider.allDiaDanh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double screenWidth = MediaQuery.of(context).size.width;
    // dataTour();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFC8D3E4)),
                  borderRadius: BorderRadius.circular(37),
                ),
              ),
              child: TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Tìm kiếm',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(37))),
                ),
                onChanged: (value) async {
                  // tim kiem
                  print(value);
                  final provider = context.read<TourProvide>();
                  await provider.listTour(value.trim() ?? "");
                  setState(() {

                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              "TOP TOUR NỔI BẬT",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildNoiBat(),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "DANH SÁCH TOUR",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          // const SizedBox(height: 15,),
          _buidListTour(),
        ],
      ),
    );
  }

  Widget _buidListTour() {
    final state = Provider.of<TourProvide>(context, listen: false).state;
    if (state.status == ListTourState.loading) {
      return ShowThongBao.show("loading");
    }
    if (state.status == ListTourState.success) {
      List<Tour> listTour = [];
      listTour = state.tours;
      return (listTour.isNotEmpty)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listTour.length,
                  itemBuilder: (context, index) {
                    Tour tour = listTour[index];
                    return ItemTourView(
                      tour: tour,
                      onDatTour: (tour) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookTourScreen(
                            tour: tour,
                          ),
                        ));
                      },
                      onChiTiet: (tour) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TourDetalScreen(
                            tour: tour,
                          ),
                        ));
                      },
                      onCapNhap: (value) {},
                      onXoa: (value) {},
                      typeHome: true,
                    );
                  },
                ),
              ],
            )
          : ShowThongBao.show("nodata");
    }
    if (state.status == ListTourState.failure) {
      return ShowThongBao.show("failure");
    }
    return ShowThongBao.show("failure");
  }

  Widget _buildNoiBat() {
    final state = Provider.of<TourProvide>(context, listen: false).stateNoiBat;
    if (state.status == ListTourState.loading) {
      return ShowThongBao.show("loading");
    }
    if (state.status == ListTourState.success) {
      List<Tour> listTourNoiBat = [];
      listTourNoiBat = state.tours;
      return (listTourNoiBat.isNotEmpty)
          ? TinTucView(
              featuredImages: listTourNoiBat.isNotEmpty
                  ? listTourNoiBat.sublist(listTourNoiBat.length - 3)
                  : Tour.listTourNoiBat(),
              onTap: (Tour tour) {
                // click tour noi bat
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TourDetalScreen(
                    tour: tour,
                  ),
                ));
              },
            )
          : ShowThongBao.show("nodata");
    }
    if (state.status == ListTourState.failure) {
      return ShowThongBao.show("failure");
    }
    return TinTucView(
      featuredImages: Tour.listTourNoiBat(),
      onTap: (Tour tour) {
        // click tour noi bat
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TourDetalScreen(
            tour: tour,
          ),
        ));
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
