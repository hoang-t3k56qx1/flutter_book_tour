import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets_manager.dart';

class ShowThongBao {


  static Widget show(String type){
    switch (type) {
      case "loading":
        return Center(
          child: Image.asset(
            ImageAssets.ic_loader,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        );

      case "nodata":
        return Center(
          child: SvgPicture.asset(
              SvgAssets.ic_noData
          ),
        );

      case "failure":
        return  Center(
          child: Image.asset(
            ImageAssets.ic_eror1,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        );
    }

    return Center(
      child: SvgPicture.asset(
      SvgAssets.ic_noData
      ),
    );

  }


}