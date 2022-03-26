import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class Place {
  final String id;
  final String name;
  final String description;
  final String urlImage;
  late int likes;
  final User? userOwner;
  late bool liked;
  late bool internet;
  Place({
    Key? key,
    this.id = "",
    required this.name,
    required this.description,
    required this.urlImage,
    this.likes = 0,
    this.liked = false,
    this.userOwner,
    this.internet = false,
  });
}
