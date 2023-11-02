// To parse this JSON data, do
//
//     final monthlyRainfall = monthlyRainfallFromJson(jsonString);

import 'dart:convert';

MonthlyRainfall monthlyRainfallFromJson(String str) => MonthlyRainfall.fromJson(json.decode(str));

String monthlyRainfallToJson(MonthlyRainfall data) => json.encode(data.toJson());

class MonthlyRainfall {
    List<List<dynamic>> data;

    MonthlyRainfall({
        required this.data,
    });

    factory MonthlyRainfall.fromJson(Map<String, dynamic> json) => MonthlyRainfall(
        data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}
