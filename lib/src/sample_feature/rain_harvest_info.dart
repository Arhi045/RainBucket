import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

/// Displays detailed information about a SampleItem.
class RainHarvestInfo extends StatelessWidget {
  const RainHarvestInfo({super.key});

  static const routeName = '/rain_harvest_info';


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 241),
      body:  Center( child: SingleChildScrollView(
        child: Column(
          children: [
            Container (
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Text('Rain harvesting is the practice of collecting and storing rainwater that falls on rooftop surfaces using barrels.', softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
              
            ),
            SizedBox(height: 2),
            Container (
              margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: const ExpansionTile(
                  title: Text('Benefits of Harvesting Rainwater'),
                  subtitle: Text('Savings and usage'),
                  children: <Widget>[
                    ListTile(title: Text('Harvesting rainwater offers several significant benefits to homeowners. First, it can lead to reduced water bills as collected rainwater can be used for non-potable purposes like watering gardens, household cleaning, and washing vehicles. ', style: TextStyle(fontSize: 13)), subtitle: Text('') ),         
          ],
        ),
              /* child: Text('Harvesting rainwater offers several significant benefits to homeowners. First, it can lead to reduced water bills as collected rainwater can be used for non-potable purposes like watering gardens, household cleaning, and washing vehicles. ', softWrap: true,
              style: TextStyle(fontSize: 15),
              ) */
              
            ),
            Container (
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: const ExpansionTile(
                  title: Text('Impact on Enviornment'),
                  subtitle: Text('Reduced risks and conservation'),
                  children: <Widget>[
                    ListTile(title: Text('Additionally, this eco-friendly practice conserves natural water resources, promotes self-sufficiency, and helps reduce local flooding risk, by directing rainwater away from storm drains. ', style: TextStyle(fontSize: 13)), subtitle: Text('')  ),         
          ],
        ),
              /* child: Text('Additionally, this eco-friendly practice conserves natural water resources, promotes self-sufficiency, and helps reduce local flooding risk, by directing rainwater away from storm drains. ', softWrap: true,
              style: TextStyle(fontSize: 15),
              ) */
              
            ),
            Container (
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: const ExpansionTile(
                  title: Text('Household Use Advantages'),
                  subtitle: Text('For plants and surfaces'),
                  children: <Widget>[
                    ListTile(title: Text('Finally, rainwater is soft and free from many contaminants, making it an ideal choice for household chores and irrigation, which can lead to healthier plants and cleaner surfaces. ', style: TextStyle(fontSize: 13)), subtitle: Text('')  ),         
          ],
        ),
              /* child: Text('Finally, rainwater is soft and free from many contaminants, making it an ideal choice for household chores and irrigation, which can lead to healthier plants and cleaner surfaces.', softWrap: true,
              style: TextStyle(fontSize: 15),
              ) */
              
            ),
            SizedBox(height: 10),
           
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              child: Image.asset('assets/images/rainGraphic.png', fit: BoxFit.contain),
            ), 
              SizedBox(height: 10),
             Align ( 
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('How to collect rainwater: '),
                    content:  SingleChildScrollView (
                      child: ListBody (
                        children: [
                          Text('1. Determine the best location on your roof to collect rainwater. The most common choice is a gutter or downspout, as it naturally directs rainwater to a specific area for collection.', softWrap: true,),
                          Text(''),
                          Text('2. Purchase a suitable rain barrel. Ensure it has a sealed lid to prevent debris and pests from entering and a spigot near the bottom for water extraction.', softWrap: true,),
                          Text(''),
                          Text('3. Place the barrel in a position so that it can capture the downflow of rainwater. Install a diversion from the gutter to the barrel if necessary.', softWrap: true,),
                          Text(''),
                          Text('More Info: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          /* TextButton (
                              onPressed: null,
                              child: Text('wikiHow collecting rainwater',
                              style: TextStyle(
                              color: Color.fromARGB(255, 74, 121, 203),
                              fontWeight: FontWeight.bold,
                      ),),
                      ), */
                      Column (
                        children: [
                          SizedBox(height: 10),
                          RichText(
                        text: TextSpan(
                          children: [
                              TextSpan(
                                        text: 'wikiHow collecting rainwater',
                                        style: const TextStyle(color: Color.fromARGB(255, 74, 121, 203), fontWeight: FontWeight.bold,),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () { launchUrl(Uri.parse('https://www.wikihow.com/Collect-Rainwater'));
                                        },
                                      ),
                            ]
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                              TextSpan(
                                        text: 'CDC rainwater collection',
                                        style: const TextStyle(color: Color.fromARGB(255, 74, 121, 203), fontWeight: FontWeight.bold,),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () { launchUrl(Uri.parse('https://www.cdc.gov/healthywater/drinking/private/rainwater-collection.html'));
                                        },
                                      ),
                            ]
                        ),
                      ),
                        ],
                      ),
                      
                      /* TextButton (
                              onPressed: null,
                              child: Text('CDC rainwater collection',
                              style: TextStyle(
                              color: Color.fromARGB(255, 74, 121, 203),
                              fontWeight: FontWeight.bold,
                      ),),
                      ), */
                      
                        ],
                      ),
                    ),
                    actions: <Widget> [
                      TextButton (
                        onPressed: () => Navigator.pop(context, 'Done'),
                        child: const Text('Done',
                        style: TextStyle(
                  color: const Color.fromARGB(255, 49, 99, 186),
                  fontWeight: FontWeight.bold,
                ),),
                      ),
                    ]
                  )
                ),
                child: Text ('How do I collect rainwater?',
                style: TextStyle(
                  fontSize: 23.5,
                  color: const Color.fromARGB(255, 49, 99, 186),
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
             )

          ],
          )

      ),
      ),
    );
  }
}



