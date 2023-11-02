import 'package:flutter/material.dart';
import 'bar_chart_rainfall.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);
  static const routeName = '/location_provider';

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final myControllerLA = TextEditingController();
  final myControllerLO = TextEditingController();
  final roofInFeet = TextEditingController();
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      myControllerLA.text = _currentPosition!.latitude.toString();
      myControllerLO.text = _currentPosition!.longitude.toString();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void dispose() {
    roofInFeet.dispose();
    myControllerLA.dispose();
    myControllerLO.dispose();
    super.dispose();
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 241),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rain Harvest Calculator",
                    style: TextStyle(
                      fontSize: 25,
                      height: 3,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ],
              ),
            const Text(
              "Enter the following inputs: ",
              style: TextStyle(
                fontSize: 18,
                height: 4,
                
              )
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 500,
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                decoration: InputDecoration( 
                  border: OutlineInputBorder(),
                  labelText: ("Roof Area (in square feet): ")
                ),
                controller: roofInFeet,
              )
              ),
            
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 500,
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ("Latitude: ")
                  ),
                  controller: myControllerLA,
                ),
              )
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 500,
              child: Container (
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ("Longitude: ")
                  ),
                  controller: myControllerLO,
                )
              ),
            ),
            const SizedBox(height: 15),
            const SizedBox(height: 40),
              //Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              //Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container (
                    margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 128, 153, 220),
                  padding: const EdgeInsets.all(25),
                ),
                onPressed: _getCurrentPosition,
                child: const Text("Get Current Location"),
                
              ),
                  ),
                  
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 83, 115, 204),
                  padding: const EdgeInsets.all(25),
                ),
                child: const Text("Calculate"),
                onPressed:  () {
                  var roofSize = int.parse(roofInFeet.text);
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RainChartApp(locData: _currentPosition, roofSize: roofSize))
                  );
                }
                
                )
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}