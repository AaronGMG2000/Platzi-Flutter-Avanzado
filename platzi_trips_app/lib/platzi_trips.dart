import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/screens/home_trip.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_trip.dart';
import 'package:platzi_trips_app/Place/ui/screens/search_trips.dart';

class PlatziTrips extends StatefulWidget {
  const PlatziTrips({Key? key}) : super(key: key);

  @override
  _PlatziTripsState createState() => _PlatziTripsState();
}

class _PlatziTripsState extends State<PlatziTrips> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    const HomeTrip(),
    const SearchTrips(),
    const ProfileTrip()
  ];

  void onTapTapped(int index){
    setState(() {
      indexTap = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white70,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
          currentIndex: indexTap,
          onTap: onTapTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


// Widget build(BuildContext context) {
//     return Scaffold(
//       body: widgetsChildren[indexTap],
//       bottomNavigationBar: CupertinoTabScaffold (
//         tabBar: CupertinoTabBar(
//           currentIndex: indexTap,
//           onTap: onTapTapped,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: 'Search',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ), tabBuilder: (BuildContext context, int index) {
//           return CupertinoTabView(
//             builder: (BuildContext context) => widgetsChildren[index],
//           );
//         },
//       ),
//     );
//   }