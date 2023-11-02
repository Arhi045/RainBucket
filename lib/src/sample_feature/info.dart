import 'package:flutter/material.dart';
//import 'package:rainbucket/src/sample_feature/harvest_calculator.bak';
import 'location_provider.dart';
import 'sample_item.dart';
import 'rain_harvest_info.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({super.key, /* required this.item */} );
  //final SampleItem item;

  static const routeName = '/info';
  @override
  State<InfoPage> createState() => _InfoPageState();

  
}
class _InfoPageState extends State<InfoPage> {

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
            icon: Icon(Icons.cloud, size:40),
            label: 'Rain Harvesting Info',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate, size:35),
            label: 'Savings Calculator',
              
          ),          
        ]),
      body:  <Widget>[
        const RainHarvestInfo(),
        const LocationPage(),
      ] [currentPageIndex]
      );
  }
}



