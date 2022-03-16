import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image_list.dart';
import 'package:platzi_trips_app/widgets/gradient.dart';

class HeaderAppbar extends StatelessWidget{
  const HeaderAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        GradientBack("TITULO"),
        CardImageList()
      ]
    );
  }

}