import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class HarvestCalculator extends StatelessWidget {
  const HarvestCalculator({super.key});

  static const routeName = '/harvest_calculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 85, 85),
        title: const Text('RainBucket'),
      ),
      body: Center(
        child: Column (
          children: [
            const Text(
              "Rain Harvest Calculator",
              style: TextStyle(
                fontSize: 25,
                height: 3,
                fontWeight: FontWeight.bold
              )
            ),
            const Text(
              "Enter the following inputs: ",
              style: TextStyle(
                fontSize: 18,
                height: 4,
                
              )
            ),
            const SizedBox(height: 15),
            const SizedBox(
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ("Roof Size (in sqe feet): ")
                ),
              )
            
            ),
            const SizedBox(height: 15),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(46.0),  
              ),
              child: const Text('Calculate'),
              
            )
          ],
        )
      ),
      
    );
  }
}
