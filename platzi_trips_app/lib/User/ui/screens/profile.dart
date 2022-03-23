import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Profile extends StatelessWidget {
  final User user;
  const Profile({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileImage = Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2.0),
            image: DecorationImage(
              image: NetworkImage(user.pathImage),
              fit: BoxFit.cover,
            )));

    final profileName = Container(
      width: 250,
      margin: const EdgeInsets.only(left: 20),
      child: AutoSizeText(
        user.name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
      ),
    );

    final profileEmail = Container(
      width: 250,
      margin: const EdgeInsets.only(left: 20),
      child: AutoSizeText(
        user.email,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          color: Colors.white38,
          fontSize: 12,
        ),
        maxLines: 2,
      ),
    );

    final profileDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[profileName, profileEmail],
    );

    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 35,
      ),
      child: Row(
        children: <Widget>[profileImage, profileDetails],
      ),
    );
  }
}
