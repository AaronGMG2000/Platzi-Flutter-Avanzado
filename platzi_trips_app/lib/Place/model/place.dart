import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class Place {
  final String id;
  final String name;
  final String description;
  final String urlImage;
  final int likes;
  final User userOwner;

  Place({
    Key? key,
    this.id = "",
    required this.name,
    required this.description,
    required this.urlImage,
    required this.userOwner,
    this.likes = 0,
  });
}
