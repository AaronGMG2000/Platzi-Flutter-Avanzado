import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class CloudfirestoreAPI {
  static const String users = "users";
  static const String places = "places";

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void updateUserData(User user) async {
    DocumentReference ref = firestore.collection(users).doc(user.uid);
    return ref.set(
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
}
