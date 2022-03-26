import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/ui/widgets/image_profile.dart';

class CloudFirestoreRepository {
  final _cloudfirestoreAPI = CloudfirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudfirestoreAPI.updateUserData(user);

  void updatePlaceDataFirestore(Place place) =>
      _cloudfirestoreAPI.updatePlaceData(place);

  List<ImageProfile> buildMyPlaces(List<DocumentSnapshot> places) =>
      _cloudfirestoreAPI.buildMyPlaces(places);

  List<Place> buildPlaces(List<DocumentSnapshot> places, User user) =>
      _cloudfirestoreAPI.buildPlaces(places, user);

  Future likePlace(Place place, String uid) =>
      _cloudfirestoreAPI.likePlace(place, uid);
}
