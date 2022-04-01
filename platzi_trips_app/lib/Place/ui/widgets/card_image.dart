import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {
  final String pathImage;
  final double height;
  final double width;
  final double left;
  final VoidCallback onPressedFab;
  final IconData iconData;
  final bool internet;
  final double top;
  const CardImage({
    required this.pathImage,
    required this.onPressedFab,
    this.height = 350,
    this.width = 300,
    this.left = 20,
    this.top = 80,
    this.iconData = Icons.favorite_border,
    this.internet = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        top: top,
        left: left,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: !internet
              ? pathImage == ''
                  ? const AssetImage("assets/images/noImage.jpg")
                  : pathImage.contains("assets")
                      ? AssetImage(pathImage)
                      : FileImage(File(pathImage)) as ImageProvider
              : CachedNetworkImageProvider(pathImage),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7),
          ),
        ],
      ),
    );
    return Row(
      children: <Widget>[
        Stack(
          alignment: const Alignment(0.9, 1.1),
          children: <Widget>[
            card,
            FloatingActionButtonGreen(
              iconData: iconData,
              onPressed: onPressedFab,
            )
          ],
        )
      ],
    );
  }
}
