import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart' as model;
import 'package:platzi_trips_app/User/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/image_profile.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User> get currentUser async => FirebaseAuth.instance.currentUser!;
  StreamController placeSelectedStreamController = StreamController();
  Stream get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink get placeSelectedSink => placeSelectedStreamController.sink;
  Future<UserCredential> signIn() {
    return _authRepository.signInFirebase();
  }

  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(model.User user) async =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) async =>
      _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudfirestoreAPI.places)
      .snapshots();
  Stream<QuerySnapshot> get placesList => placesListStream;

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  List<ImageProfile> buildMyPlaces(List<DocumentSnapshot> places) =>
      _cloudFirestoreRepository.buildMyPlaces(places);

  List<Place> buildPlaces(List<DocumentSnapshot> places, model.User user) =>
      _cloudFirestoreRepository.buildPlaces(places, user);

  Future likePlace(Place place, String uid) =>
      _cloudFirestoreRepository.likePlace(place, uid);

  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudfirestoreAPI.places)
      .where('userOwner',
          isEqualTo: FirebaseFirestore.instance
              .doc(CloudfirestoreAPI.users + '/' + uid))
      .snapshots();
  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {}
}
