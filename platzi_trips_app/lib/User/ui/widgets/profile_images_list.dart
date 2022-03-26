import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class ProfileImagesList extends StatelessWidget {
  final User user;
  const ProfileImagesList({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: const EdgeInsets.only(top: 280.0),
      child: StreamBuilder(
          stream: userBloc.myPlacesListStream(user.uid),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return ListView(
                  children: userBloc.buildMyPlaces(snapshot.data.docs),
                );
              case ConnectionState.done:
                return ListView(
                  children: userBloc.buildMyPlaces(snapshot.data.doc),
                );
            }
          }),
    );
  }
}
