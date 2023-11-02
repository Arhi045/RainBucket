import 'package:flutter/material.dart';
import 'basin_data.dart';
import 'jsondb.dart';

class BasinDataTableWidget extends StatefulWidget {

  const BasinDataTableWidget({
  super.key,
  required this.BasinId,
  });

final String? BasinId;


  @override
  _BasinDataTableWidgetState createState() => _BasinDataTableWidgetState();
}

class _BasinDataTableWidgetState extends State<BasinDataTableWidget> {
  List<Basin> basins = [];
  Map? basin;
   late String BasinID;

  @override
  void initState() {
    BasinID = widget.BasinId!;
    _loadBasins();
    super.initState();
  }

/*
  Future<void> _loadBasins() async {
    List<Map<String, dynamic>>? basinMaps = await DatabaseHelper.instance.getBasinById(BasinID);
    basins = basinMaps!.map((map) => Basin.fromMap(map)).toList();
    basin = basins[0].toMap();
    setState(() {});
  }
*/

  Future<void> _loadBasins() async {
    Map<String, dynamic>? basinMaps = await JasonDBHelper().getBasinById(BasinID);
    
    basin = basinMaps;
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 99, 186),
        title: const Text('Basin Information'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Field')),
            DataColumn(label: Text('Value')),
          ],
          rows: basin!.entries
              .map(
                (entry) => DataRow(
                  cells: [
                    DataCell(Text(entry.key.toString())),
                    DataCell(
Expanded(child: (entry.value.toString()=="YES")?

        TextButton.icon(icon: const Icon(Icons.warning,
        color: Colors.red,), onPressed: () {  }, label: const Text("Overdraft!"),):
    
  GestureDetector(
    onLongPress: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Details"),
            content: Text(entry.value.toString()), // You can add more content here
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
          )],
          );
        },
      );
    },
    child: Text(
        entry.value.toString(),
        maxLines: null,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  )
  ),
// Add GestureDetector and AlertDialog for other attributes similarly

//                    DataCell(Tooltip(message: entry.value.toString(), child: (Text(entry.value.toString(), maxLines: null, overflow: TextOverflow.ellipsis,)))),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
