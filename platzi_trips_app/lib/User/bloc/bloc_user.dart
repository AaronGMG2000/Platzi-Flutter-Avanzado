import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart' as model;

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  Future<UserCredential> signIn() {
    return _authRepository.signInFirebase();
  }

  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(model.User user) async =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {}
}
