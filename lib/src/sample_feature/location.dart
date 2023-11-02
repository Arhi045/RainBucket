import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class Location extends StatelessWidget {
  const Location({super.key});

  static const routeName = '/location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RainBucket'),
      ),
      body: Center(
        child: Column (
          children: [
            const Text(
              "Enter: ",
              style: TextStyle(
                fontSize: 25,
                height: 3,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 15),
            const SizedBox(
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ("Latitude:")
                ),
              )
            
            ),
            const SizedBox(height: 15),
            const SizedBox(
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ("Longitude: ")
                ),
              ), 
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(46.0),  
              ),
              child: const Text('Continue'),
              
            )
          ],
        )
      ),
    );
  }
}
