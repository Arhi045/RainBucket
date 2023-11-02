
//import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
//import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'monthly_rainfall.dart';
import 'package:http/http.dart' as http;
//import 'package:collection/collection.dart';

//import 'package:intl/intl.dart';
//import '../location/location_provider.dart';


class RainChartApp extends StatefulWidget {

const RainChartApp({
  super.key,
  required this.locData,
  required this.roofSize,
});

final Geolocator.Position? locData;
final int roofSize;

  @override

State<RainChartApp> createState() => _RainChartAppState();

}


class _RainChartAppState extends State<RainChartApp> {

  late List<List<dynamic>> data;
  late TooltipBehavior _tooltip;

  bool loading = true;




  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
    double? latid = widget.locData?.latitude;
    double? longit = widget.locData?.longitude;
    final String paramString = "http://data.rcc-acis.org/GridData?params={\"loc\":\"${longit},${latid}\",\"sdate\":\"2022-10\",\"edate\":\"2023-9\",\"grid\":\"21\",\"output\":\"json\",\"elems\":[{\"name\":\"mly_pcpn\"}]}";

    getData(paramString);
  }

/* 
  void getData() async {
    var response = await http.get(
        Uri.parse("https://www.ncei.noaa.gov/cdo-web/api/v2/data?datasetid=GSOM&datatypeid=PRCP&stationid=GHCND:USC00010008&startdate=2010-01-01&enddate=2010-05-01"),
        headers: <String, String> {"token": 'NiPdNkMpEyYNrvREPkCfHoXrgtPbeCDY'}
        );

*/

//  static const double latid = 37.73;

//  static const double longit = -121.43;

  

  void getData(String urlparam) async {
    var response = await http.get(
        Uri.parse(urlparam),
        );



    List<List<dynamic>> tempdata = monthlyRainfallFromJson(response.body).data;
    setState(() {
      data = tempdata;
      loading = false;
    });
  }




  @override
  Widget build(BuildContext context) {

//    Position? latlong = LocationProvider().requestLocation(context);
//    String paramString = "http://data.rcc-acis.org/GridData?params={\"loc\":\"${latlong},${latid}\",\"sdate\":\"2022-10\",\"edate\":\"2023-9\",\"grid\":\"21\",\"output\":\"json\",\"elems\":[{\"name\":\"mly_pcpn\"}]}";

      Widget rainChart = SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 10),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<List<dynamic>, String>>[
              ColumnSeries<List<dynamic>, String>(
                  dataSource: data,
                  xValueMapper: (List<dynamic> data, _) => data[0],
                  yValueMapper: (List<dynamic> data, _) => data[1],
                  name: 'Monthly Rainfall',
                  color: Color.fromRGBO(8, 142, 255, 1))
            ]);


//List monthlyValues = data[5];

/*final */num sum = data.fold(0, (previousValue, element) => previousValue + element[1]);
//num max = data.fold(0, (previousValue, element) => element[1] > previousValue ? element[1] : previousValue);
sum = sum.round();
int rSize = widget.roofSize;
num rainCollection = rSize * 0.6 * sum * 0.75;
rainCollection = rainCollection.round();
num landscapeUse = rainCollection/190;
landscapeUse = landscapeUse.round();
num savings = rainCollection * 0.02;
savings = savings.round();
num barrels = ((rainCollection/data.length))/60;
barrels = barrels.ceil();

//const int sum = 20;
//final int sum = monthly_values.sum;
//final sum = monthlyValues[1];
 
Widget calcSummary = Column(
  children: [
    Container(
      margin: EdgeInsets.only(top: 10, left: 20, right:20),
      child: Column (
        children: [
        Text('The total yearly rainfall for your location is about $sum inches', softWrap: true, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 25),
        RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(Icons.water_drop),
              ),
              TextSpan(
                text: ' With a roof size of $rSize square feet, you can collect ',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextSpan(
                text: '$rainCollection Gallons ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)
              ),
              TextSpan(
                text: 'of rainwater this year',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            ]
          )
        ), 
        SizedBox(height: 15),
        RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(Icons.local_drink),
              ),
              TextSpan(
                text: ' We recommend using ',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextSpan(
                text: '$barrels barrels ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)
              ),
              TextSpan(
                text: 'that are around 60 gallons large to harvest rainwater',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            ]
          )
        ), 
        SizedBox(height: 15),
        RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(Icons.grass),
              ),
              TextSpan(
                text: ' With the rainwater you collected, you can water your landscaping ',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextSpan(
                text: '$landscapeUse times ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)
              ),
              TextSpan(
                text: 'this year',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            ]
          )
        ), 
        SizedBox(height: 15),
        RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(Icons.attach_money),
              ),
              TextSpan(
                text: 'This will save you ',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextSpan(
                text: '$savings dollars ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16)
              ),
              TextSpan(
                text: 'a year on your water bill',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            ]
          )
        ), 
        SizedBox(height: 15),
     ],
    
    ),
     
    ), 
  ],
  
);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 241),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 49, 99, 186),
          title: const Text('Monthly Rainfall for 2022-23 Rain Year'),
        ),
        body:  Center(
        child: Column(
          children: [
            rainChart,
            calcSummary, 
          ])

      ),
     );

  }

  

}

