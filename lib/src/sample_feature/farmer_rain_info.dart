import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

/// Displays detailed information about a SampleItem.
class FarmerGWInfo extends StatelessWidget {
  const FarmerGWInfo ({super.key});

  static const routeName = '/farmer_GW_info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 241),
      body:  Center( child: SingleChildScrollView(
       child: Container ( 
        margin: EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            textSection,
            SizedBox(height: 60),
            Image.asset('assets/images/waterpump.png'),
          ])
       )
      )),
    );
  }
}



Widget textSection = 

 Column(
      children: <Widget>[
        ExpansionTile(
          title: const Text('Groundwater Recharge'),
          subtitle: const Text('What is Groundwater Recharge?'),
          children: <Widget>[
            const ListTile(title: Text(''),
            subtitle: Text('Groundwater recharge is the process of replenishing underground water sources by allowing rainwater and irrigation runoff to sink into the soil, refilling aquifers that farmers depend on for their crops and livestock. It helps ensure a sustainable and reliable supply of groundwater for agricultural needs, promoting long-term farming success.'),),
            ListTile(title: const Text('Additional resources'),
            subtitle: hinfo,),            
          ],
        ),
        ExpansionTile(
          title: Text('Methods for Groundwater Recharging'),
          subtitle: Text('Issues, strategies, and uses'),
          children: <Widget>[
            ListTile(title: Text(''),
            subtitle: Text('Farmers can employ various methods to enhance groundwater recharge on their land. One effective approach involves constructing catchment basins or contour trenches to capture and direct rainwater into the soil, allowing it to seep into the aquifers. Additionally, implementing cover cropping and reduced tillage practices can improve soil structure, enhancing its ability to absorb and retain water, ultimately contributing to groundwater replenishment. Combining these techniques with responsible water management can help ensure a resilient and sustainable water supply for farming operations.'),),
            ListTile(title: Text('Additional resources'),
            subtitle: methods,),
          ],
        ),
        ExpansionTile(
          title: Text('What are GSAs?'),
          subtitle: Text('Purpose, authority, and more'),
          children: <Widget>[
            ListTile(title: Text(''),
            subtitle: Text('Groundwater sustainability agencies are organizations established to manage and regulate groundwater resources within specific regions or basins. Their primary purpose is to ensure the long-term sustainability of groundwater by setting and enforcing rules and practices that prevent over-extraction, maintain water quality, and protect this vital resource for present and future generations.'),),
            ListTile(title: Text('Additional resources'),
            subtitle: SGMAInfo,),
          ],
        ),
      ],
    );

/*
  child: const Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
  */

Widget hinfo =  RichText(
    text: TextSpan(
      children: [
         TextSpan(
                  text: 'Accelerating groundwater recharge',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { launchUrl(Uri.parse('https://suscon.org/wp-content/uploads/2021/06/Accelerating-Groundwater-Recharge.pdf'));
                  },
                ),
      ]
    )

  );
  Widget methods =  RichText(
    text: TextSpan(
      children: [
         TextSpan(
                  text: 'Recharge Methods',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { launchUrl(Uri.parse('https://suscon.org/wp-content/uploads/2023/08/Recharge-Methods-Manual_Case-Studies_2023.pdf'));
                  },
                ),
      ]
    )

  );
  Widget SGMAInfo =  RichText(
    text: TextSpan(
      children: [
         TextSpan(
                  text: 'SGMA Info',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { launchUrl(Uri.parse('https://water.ca.gov/programs/groundwater-management/sgma-groundwater-management'));
                  },
                ),
      ]
    )

  );