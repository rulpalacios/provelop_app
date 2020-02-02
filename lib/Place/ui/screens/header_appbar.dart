import 'package:flutter/material.dart';
import 'package:provelop_app/widgets/gradient_back.dart';
import 'package:provelop_app/Place/ui/widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {

  double height = 250.0;

  HeaderAppBar({
    Key key,
    this.height
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(height: this.height),
        // CardImageList()
      ],
    );
  }

}