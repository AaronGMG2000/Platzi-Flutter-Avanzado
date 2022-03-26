import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/screens/gradient_text.dart';
import 'package:platzi_trips_app/User/ui/screens/options_bar.dart';
import 'package:platzi_trips_app/User/ui/screens/profile.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_images_list.dart';
import 'package:platzi_trips_app/widgets/gradient.dart';

class ProfileTrip extends StatelessWidget {
  const ProfileTrip({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc;
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
      stream: userBloc.authStatus,
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 35,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                "NO SE PUDO CARGAR LA INFORMACIÓN",
              ),
            ),
          ],
        ),
        alignment: Alignment.center,
      );
    } else {
      User user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        pathImage: snapshot.data.photoURL,
      );
      return Stack(
        children: <Widget>[
          const GradientBack(height: 400.0),
          ProfileImagesList(user: user),
          Column(
            children: <Widget>[
              const GradientText("Profile"),
              Profile(user: user),
              const OptionsBar()
            ],
          ),
        ],
      );
    }
  }
}
