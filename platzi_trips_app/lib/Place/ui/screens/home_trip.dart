import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/description_place.dart';
import 'package:platzi_trips_app/Place/ui/screens/header_appbar.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review_list.dart';

class HomeTrip extends StatelessWidget {
  const HomeTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(children: const <Widget>[
          DescriptionPlace("Halo", 4,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean dapibus blandit maximus. Suspendisse vel imperdiet arcu, et finibus sem. Curabitur ut dui sit amet sapien mattis efficitur. Morbi aliquet ullamcorper nibh at tincidunt. Praesent tellus ex, convallis sed dictum at, fermentum sed sem. Duis nisi nunc, mattis in ultrices quis, eleifend et dui. Proin tempor arcu id mattis volutpat. Ut semper quam quis dictum dignissim. Cras pellentesque nibh dolor, at varius tortor auctor eget. Integer ac dapibus erat. Proin vestibulum ornare neque non venenatis. Mauris volutpat nec sem vitae rhoncus. Praesent non mattis tellus. Cras nec semper leo. Morbi at nisi lacus. Quisque facilisis felis ut felis congue tempus.'''),
          ReviewList()
        ]),
        const HeaderAppbar()
      ],
    );
  }
}
