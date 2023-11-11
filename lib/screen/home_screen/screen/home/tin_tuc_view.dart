import 'package:flutter/material.dart';
import 'package:flutter_book_tour/model/tour_model.dart';
import 'package:flutter_book_tour/screen/home_screen/screen/home/tin_tuc_item_view.dart';

import '../../../../assets_manager.dart';
import '../../../../model/tin_tuc_moi_model.dart';

class TinTucView extends StatefulWidget {
  const TinTucView({required this.featuredImages, required this.onTap ,super.key});
  final ValueChanged<Tour> onTap;
  final List<Tour> featuredImages;

  @override
  _TinTucViewState createState() => _TinTucViewState();
}

class _TinTucViewState extends State<TinTucView> {
  final PageController _controller = PageController(initialPage: 0, viewportFraction: 0.9,);
  List<Tour> _featuredImages = [];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Lắng nghe sự kiện thay đổi trang
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
    _featuredImages = widget.featuredImages;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Phần hiển thị hình ảnh nổi bật
        Container(
          height: 200,
          child: PageView.builder(
            controller: _controller,
            itemCount: _featuredImages.length,
            itemBuilder: (BuildContext context, int index) {
              Tour item = _featuredImages[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8,bottom: 8),
                child: InkWell(
                  onTap: (){
                    widget.onTap(item);
                  },
                  child: ItemWithTextOverlay(item: item,),
                ),
              );
            },
          ),
        ),
        // Phần hiển thị 3 chấm
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _featuredImages.length,
                (index) => Padding(
              padding: const EdgeInsets.all(6.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == index ? 20.0 : 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.blue // Màu chấm được chọn
                      : Colors.grey, // Màu chấm không được chọn
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
