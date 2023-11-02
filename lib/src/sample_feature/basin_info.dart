
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;


class BasinInfoApp extends StatefulWidget {

const BasinInfoApp({
  super.key,
  required this.mapInfo,
});

final Map? mapInfo;

  @override

State<BasinInfoApp> createState() => _BasinInfoAppState();

}


class _BasinInfoAppState extends State<BasinInfoApp> {

  Map? data;

  String sb_name ="Unknow";

  @override
  void initState() {
    data = widget.mapInfo;
    sb_name = data!["Basin_Subbasin_Name"];
    super.initState();
  }

 

  void getData(String urlparam) async {

/*
    var response = await http.get(
        Uri.parse(urlparam),
        );
*/
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Text('Basin Information for $sb_name', ),
          backgroundColor: Color.fromARGB(255, 49, 99, 186),
        ),
        body:  Center(
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
              rows: data!.entries.map(
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
     );

  }

  

}

