import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/screens/title_input_location.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;
  const AddPlaceScreen({Key? key, required this.image}) : super(key: key);
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  final _controllerLocationPlace = TextEditingController();
  late UserBloc userBloc = BlocProvider.of<UserBloc>(context);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        const GradientBack(height: 300),
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 25, left: 5),
              child: SizedBox(
                height: 45,
                width: 45,
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 45,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.only(top: 45, left: 20, right: 10),
                child: const TitleHeader(title: "Add new Place"),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 120,
            bottom: 20,
          ),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 20),
                child: CardImage(
                  pathImage: widget.image.path,
                  iconData: Icons.camera_alt,
                  height: 250,
                  width: 375,
                  left: 15,
                  top: 0,
                  onPressedFab: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextInput(
                  hinText: "Title",
                  controller: _controllerTitlePlace,
                ),
              ),
              TextInput(
                hinText: "Description",
                inputType: TextInputType.multiline,
                controller: _controllerDescriptionPlace,
                maxlines: 6,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TitleInputLocation(
                    hinText: "Add Location",
                    controller: _controllerLocationPlace,
                    iconData: Icons.location_on),
              ),
              ButtonPurple(
                buttonText: "Add Place",
                onPressed: () {
                  userBloc.currentUser.then((user) {
                    String path =
                        "${user.uid}/${DateTime.now().toString()}.jpg";
                    userBloc.uploadFile(path, widget.image).then((storage) {
                      storage.then((snapshot) {
                        snapshot.ref.getDownloadURL().then((downloadUrl) {
                          userBloc.updatePlaceData(
                            Place(
                              name: _controllerTitlePlace.text,
                              description: _controllerDescriptionPlace.text,
                              urlImage: downloadUrl,
                              likes: 0,
                            ),
                          );
                          Navigator.of(context).pop();
                        });
                      });
                    }).onError((error, stackTrace) {});
                  });
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
