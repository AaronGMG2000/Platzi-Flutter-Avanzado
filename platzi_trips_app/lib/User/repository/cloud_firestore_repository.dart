import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudfirestoreAPI = CloudfirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudfirestoreAPI.updateUserData(user);
}
