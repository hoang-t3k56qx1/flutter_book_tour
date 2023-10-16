import 'package:flutter/material.dart';


class ImgTourDetalView extends StatefulWidget {
  const ImgTourDetalView({super.key, required this.featuredImages});
  final List<String> featuredImages;


  @override
  _ImgTourDetalViewState createState() => _ImgTourDetalViewState();
}

class _ImgTourDetalViewState extends State<ImgTourDetalView> {
  final PageController _controller = PageController(initialPage: 0, viewportFraction: 0.9,);
  late List<String> _featuredImages = [];

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
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            controller: _controller,
            itemCount: _featuredImages.length,
            itemBuilder: (BuildContext context, int index) {
              String img = _featuredImages[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8,bottom: 8),
                child: Image.network(
                  img,
                  height: 200,
                  width: screenWidth - 60.0,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
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
