import 'package:flutter/material.dart';
import 'package:rainbucket/src/sample_feature/farmer_location.dart';
import 'package:rainbucket/src/sample_feature/farmer_rain_info.dart';
//import 'package:rainbucket/src/sample_feature/harvest_calculator.bak';
//import 'location_provider.dart';
import 'sample_item.dart';
//import 'rain_harvest_info.dart';


class FarmerNav extends StatefulWidget {
  const FarmerNav({super.key, /* required this.item */} );
  //final SampleItem item;

  static const routeName = '/GWInfo';
  @override
  State<FarmerNav> createState() => _FarmerNavState();

  
}
class _FarmerNavState extends State<FarmerNav> {

  int currentPageIndex = 0;
  late SampleItem item;

  void initState() {
    super.initState();
    //item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 107, 169),
        title: const Text('Rain Bucket'),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 159, 173, 202),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          }); // setState
        },
        selectedIndex: currentPageIndex,
        destinations: const<Widget>[
          NavigationDestination(
            icon: Icon(Icons.water_damage, size:40),
            label: 'Groundwater Recharge Info',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined, size:35),
            label: 'Groundwater Basin Map',
              
          ),          
        ]),
      body:  <Widget>[
        const FarmerGWInfo(),
        const FarmerLocation(),
      ] [currentPageIndex]
      );
  }
}



