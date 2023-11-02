import 'package:flutter/material.dart';
import 'sample_item.dart';
import 'location_provider.dart';
import 'rain_harvest_info.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatefulWidget {
  const SampleItemDetailsView({super.key, required this.item});
  final SampleItem item;

  static const routeName = '/sample_item';

  @override
  State<SampleItemDetailsView> createState() => _SampleItemDetailsViewState();

}

class _SampleItemDetailsViewState extends State<SampleItemDetailsView> {

  int currentPageIndex = 0;
  late SampleItem item;

  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(item.itemDetails),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          }); // setState
        },
        selectedIndex: currentPageIndex,
        destinations: const<Widget>[
          NavigationDestination(
            //selectedIcon: Icon(Icons.cloud),
            icon: Icon(Icons.cloud),
            label: 'Rain Harvesting Info',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Savings Calculator',
          ),          
        ]),
      body:  <Widget>[
        RainHarvestInfo(),
        LocationPage(),
      ] [currentPageIndex]
      );
  }
}
