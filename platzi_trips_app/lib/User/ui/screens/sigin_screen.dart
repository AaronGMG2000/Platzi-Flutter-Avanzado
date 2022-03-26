import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart' as model;
import 'package:platzi_trips_app/platzi_trips.dart';
import 'package:platzi_trips_app/widgets/button_greem.dart';
import 'package:platzi_trips_app/widgets/gradient.dart';

class SiginScreen extends StatefulWidget {
  const SiginScreen({Key? key}) : super(key: key);

  @override
  _SiginScreenState createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handlecurrentSession();
  }

  Widget sigInGoogleUI(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const GradientBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: SizedBox(
                  width: screenWidth,
                  child: const Text(
                    "Welcome \n this is your Travel App",
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ButtonGreem(
                text: "Sign in with Google",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((UserCredential user) {
                    userBloc.updateUserData(model.User(
                      uid: user.user?.uid ?? "",
                      name: user.user?.displayName ?? "",
                      email: user.user?.email ?? "",
                      pathImage: user.user?.photoURL ?? "",
                    ));
                  });
                },
                width: 300,
                height: 50,
                radius: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _handlecurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return sigInGoogleUI(context);
        } else {
          return const PlatziTrips();
        }
      },
    );
  }
}
