import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:rainbucket/src/sample_feature/basin_view.dart';
//import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
//import '../barchart/basin_prop-data.dart';
//import 'basin_info.dart';

class BasinMap extends StatefulWidget {
  const BasinMap({
  super.key,
  required this.locData,
  });

final Geolocator.Position? locData;
  static const routeName = '/BasinMap';
  @override
  _BasinMapState createState() => _BasinMapState();
}

class _BasinMapState extends State<BasinMap> {

double? latid;
double? longit;


  @override
  void initState() {
    super.initState();
    latid = widget.locData?.latitude;
    longit = widget.locData?.longitude;

  }

  @override
  Widget build(BuildContext context) {

    final markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(latid!, longit!), // Latitude 37, Longitude -119
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_pin,
            color: Color.fromARGB(255, 24, 31, 43),
            size: 40.0,
          ),
        ),
      ),
    ];





    return Scaffold(
        appBar: AppBar(title: Text('CA Basin Map'), backgroundColor: Color.fromARGB(255, 49, 99, 186),),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(latid!, longit!),
//                    center: LatLng(36.778259, -119.417931),
                    // center: LatLng(47.925812, 106.919831),
                    zoom: 7.0,
                    plugins: [EsriPlugin()],

                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                      'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                    ),
                    FeatureLayerOptions("https://gis.water.ca.gov/arcgis/rest/services/Geoscientific/i08_B118_CA_GroundwaterBasins/FeatureServer/0",
                      "polygon",
                      onTap: (dynamic attributes, LatLng location) {
                        
                        if(attributes != null) {
                          //final basinPropData = basinPropDataFromJson(attributes.toString());
                          Map basinPropData =  attributes;
                        //print(basinPropData['Basin_Name']);

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BasinDataTableWidget(BasinId: basinPropData["Basin_Subbasin_Number"])),
                            );
                        }
                        
                      },
                      render: (dynamic attributes){
                        // You can render by attribute
                        return PolygonOptions(
                            borderColor: Colors.blueAccent,
                            color: Colors.black12,
                            borderStrokeWidth: 2
                        );
                      },
                    ),
                    MarkerLayerOptions(markers: markers),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }


/*

 basinInfo(BuildContext context, Map bdata) {

//print(bdata);
   showDialog(
              context: context,
              builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text("Basin Info"),
          content:  SafeArea(
        child: Center(
          child: Scrollbar(
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text('Field'),
                ),
                DataColumn(
                  label: Text('Value'),
                ),
              ],
              rows: bdata.entries.map(
                      (entry) => DataRow(
                      cells: [
                        DataCell(Text(entry.key.toString())),
                        DataCell(Text(entry.value.toString())),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
           child: const Text("Close"),
           onPressed: () {
           Navigator.of(context).pop(); // your code
            },
         ),
       ],

    );
  });


}

*/

}