import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final String email;
  final String pathImage;
const Profile(this.name, this.email, this.pathImage ,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    final profileImage = Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2.0),
            image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover,
            )));

    final profileName = Container(
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );


    final profileEmail = Container(
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        email,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Lato',
          color: Colors.white38,
          fontSize: 16,
        ),
      ),
    );

    final profileDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        profileName,
        profileEmail
      ],
    );

    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 35),
      child: Row(
        children: <Widget>[
          profileImage,
          profileDetails
        ],
      ),
    );
  }
}