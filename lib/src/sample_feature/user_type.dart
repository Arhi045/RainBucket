import 'package:flutter/material.dart';
//import 'package:rainbucket/src/sample_feature/farmer_rain_info.dart';
//import 'package:rainbucket/src/sample_feature/basin_map.dart';
import 'package:rainbucket/src/sample_feature/info.dart';
//import 'package:rainbucket/src/sample_feature/farmer_location.dart';
//import 'package:rainbucket/src/sample_feature/location.dart';
import 'farmer_nav.dart';

class UserType extends StatelessWidget {
  const UserType({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 99, 186),
        title: const Text('  RainBucket'),
      ),
      body: Center(
      child: Column (
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "I am a: ",
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          const SizedBox(
            height: 100
          ),  

          ElevatedButton(
            onPressed: () {
              Navigator.restorablePushNamed(
                context,
                InfoPage.routeName
                );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(46.0),
              backgroundColor: Color.fromARGB(255, 49, 99, 186),
            ),
            child: const Text('Homeowner',
            style: TextStyle(
              fontSize: 25,
            ),
            ),
          ),
          const SizedBox(height: 70),
          ElevatedButton(
            onPressed: () {
              Navigator.restorablePushNamed(
                context,
                FarmerNav.routeName
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(46.0),
              backgroundColor: Color.fromARGB(255, 49, 99, 186),
              
            ),
            child: const Text('    Farmer    ',
            style: TextStyle(
              fontSize: 25,
            ),
            ),
          ),
        
      
        ],
      )
      ),
    );
  }
}
