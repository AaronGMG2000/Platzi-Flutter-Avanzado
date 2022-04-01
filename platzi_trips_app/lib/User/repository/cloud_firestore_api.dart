import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/model/user.dart' as model;
import 'package:platzi_trips_app/User/ui/widgets/image_profile.dart';

class CloudfirestoreAPI {
  static const String users = "users";
  static const String places = "places";

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void updateUserData(model.User user) async {
    DocumentReference ref = firestore.collection(users).doc(user.uid);
    return await ref.set(
      {
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'photoURL': user.pathImage,
        'myPlaces': user.myPlaces,
        'myFavoritePlaces': user.myFavoritePlaces,
        'lastSignIn': DateTime.now()
      },
      SetOptions(merge: true),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updatePlaceData(Place place) async {
    CollectionReference ref = firestore.collection(places);
    User? user = _auth.currentUser;
    ref.add(
      {
        'name': place.name,
        'description': place.description,
        'urlImage': place.urlImage,
        'likes': place.likes,
        'userOwner': firestore.doc("users/${user?.uid}"),
        'usersLiked': [],
      },
    ).then((dr) {
      dr.get().then((snapshot) {
        DocumentReference refUsers = firestore.collection(users).doc(user?.uid);
        refUsers.update({
          'myPlaces':
              FieldValue.arrayUnion([firestore.doc("places/${snapshot.id}")])
        });
      });
    });
  }

  List<ImageProfile> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ImageProfile> imageProfiles = [];
    for (var place in placesListSnapshot) {
      imageProfiles.add(
        ImageProfile(
          url: place.get("urlImage"),
          calification: place.get("likes").toString(),
          description: place.get("description"),
          name: place.get("name"),
          onPressedFav: () {},
        ),
      );
    }

    return imageProfiles;
  }

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, model.User user) {
    List<Place> places = [];

    for (var p in placesListSnapshot) {
      Place place = Place(
        id: p.id,
        name: p.get("name"),
        description: p.get("description"),
        urlImage: p.get("urlImage"),
        likes: p.get("likes"),
      );
      List usersLikedRefs = p.get("usersLiked");
      place.liked = false;
      for (var drUL in usersLikedRefs) {
        if (user.uid == drUL.id) {
          place.liked = true;
          break;
        }
      }
      places.add(place);
    }
    return places;
  }

  Future likePlace(Place place, String uid) async {
    DocumentReference ref = firestore.collection(places).doc(place.id);
    ref.update({
      'likes': place.liked ? FieldValue.increment(1) : FieldValue.increment(-1),
      'usersLiked': place.liked
          ? FieldValue.arrayUnion([firestore.doc("users/$uid")])
          : FieldValue.arrayRemove([firestore.doc("users/$uid")]),
    });
  }
}
