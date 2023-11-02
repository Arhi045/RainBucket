import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'basin_data2.dart';


class JasonDBHelper {



 // Fetch content from the json file

Future<Map<String, dynamic>?> getBasinById(String basinId) async {
  
  String response = await rootBundle.loadString("assets/basin.json");
    final data = basinDataFromJson(response);
    BasinData _item = data[basinId]!;

    return _item.toJson();  

}



}