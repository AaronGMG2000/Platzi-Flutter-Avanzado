import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/circle_button.dart';

class OptionsBar extends StatelessWidget {
  const OptionsBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleButton(
            onPressed: () {},
            size: 50,
            iconSize: 30,
            iconData: Icons.vpn_key,
          ),
          CircleButton(
            onPressed: () {
              ImagePicker picker = ImagePicker();
              picker.pickImage(source: ImageSource.camera).then(
                (image) async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPlaceScreen(
                        image: File(image?.path ?? ""),
                      ),
                    ),
                  );
                },
              ).catchError((onError) {});
            },
            size: 60,
            iconSize: 50,
            iconData: Icons.add,
          ),
          CircleButton(
            onPressed: () {
              userBloc.signOut();
            },
            size: 50,
            iconSize: 30,
            iconData: Icons.exit_to_app,
          )
        ],
      ),
    );
  }
}
