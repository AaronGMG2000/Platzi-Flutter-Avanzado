import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String pathImage;
  final String name;
  final String details;
  final String comment;
  const Review(this.name, this.pathImage, this.details, this.comment,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    const star = Icon(
      Icons.star,
      color: Color(0xFFf2C611),
      size: 20,
    );
    
    final userComment = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final userInfo = Container(
      margin: const EdgeInsets.only(left: 20.0, right: 15),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 13.0,
          color: Color(0xFFa3a5a7),
        ),
      ),
    );

    final userName = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 17.0,
        ),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        Row(children: <Widget>[userInfo, star, star, star, star, star]),
        userComment
      ],
    );

    final photo = Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover,
            )));

    return Row(children: <Widget>[photo, userDetails]);
  }
}
