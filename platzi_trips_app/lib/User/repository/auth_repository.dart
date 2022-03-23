import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/repository/firebase_auh.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();
  Future<UserCredential> signInFirebase() =>
      _firebaseAuthAPI.signInWithGoogle();

  signOut() => _firebaseAuthAPI.singOut();
}
