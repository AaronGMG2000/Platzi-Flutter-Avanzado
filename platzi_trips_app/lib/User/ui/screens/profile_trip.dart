import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/screens/gradient_text.dart';
import 'package:platzi_trips_app/User/ui/screens/options_bar.dart';
import 'package:platzi_trips_app/User/ui/screens/profile.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_images_list.dart';
import 'package:platzi_trips_app/widgets/profiel_gradient2.dart';
import 'package:platzi_trips_app/widgets/profile_gradient.dart';

class ProfileTrip extends StatelessWidget {
  const ProfileTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const ProfileGradient(400),
        const Positioned(
              child: ProfielGradient2(400),
              top: 0,
              left: 250,
              right: 0,
        ),
        const ProfileImagesList(),
        const ProfileGradient(300),
        const Positioned(
              child: ProfielGradient2(300),
              top: 0,
              left: 250,
              right: 0,
        ),
        Column(
          children: const <Widget>[
            GradientText("Profile"),
            Profile("Rudy Marroquín", "rudy.gopal.2000@gmail.com",
                "assets/images/unnamed.jpg"),
            OptionsBar()
          ],
        ),
        
      ],
    );
  }
}
