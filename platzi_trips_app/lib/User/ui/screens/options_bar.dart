import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
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
            onPressed: () {},
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
