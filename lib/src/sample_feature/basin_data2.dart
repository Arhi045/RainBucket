// To parse this JSON data, do
//
//     final basinData = basinDataFromJson(jsonString);

import 'dart:convert';

Map<String, BasinData> basinDataFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, BasinData>(k, BasinData.fromJson(v)));

String basinDataToJson(Map<String, BasinData> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class BasinData {
    String? basinId;
    String? basinName;
    String? subbasinName;
    String? basinAcres;
    String? basinSqMiles;
    String? criticalOverdraft;
    String? irrigatedAcres;
    String? groundwaterAcreFeet;
    String? groundwaterAfAcre;
    String? gwOfTotalSupply;
    String? decliningGwLevelsPoints;
    String? gwlDeclineComments;
    String? subsidenceComments;
    String? sgma2019BasinPriority;

    BasinData({
        this.basinId,
        this.basinName,
        this.subbasinName,
        this.basinAcres,
        this.basinSqMiles,
        this.criticalOverdraft,
        this.irrigatedAcres,
        this.groundwaterAcreFeet,
        this.groundwaterAfAcre,
        this.gwOfTotalSupply,
        this.decliningGwLevelsPoints,
        this.gwlDeclineComments,
        this.subsidenceComments,
        this.sgma2019BasinPriority,
    });

    factory BasinData.fromJson(Map<String, dynamic> json) => BasinData(
        basinId: json["BasinID"],
        basinName: json["Basin Name"],
        subbasinName: json["Subbasin Name"],
        basinAcres: json["Basin Acres"],
        basinSqMiles: json["Basin SqMiles"],
        criticalOverdraft: json["Critical Overdraft"],
        irrigatedAcres: json["Irrigated Acres"],
        groundwaterAcreFeet: json["Groundwater (Acre-feet)"],
        groundwaterAfAcre: json["Groundwater AF_Acre"],
        gwOfTotalSupply: json["GW_of total supply"],
        decliningGwLevelsPoints: json["Declining GW Levels Points"],
        gwlDeclineComments: json["GWL Decline Comments"],
        subsidenceComments: json["Subsidence Comments"],
        sgma2019BasinPriority: json["SGMA 2019 Basin Priority"],
    );

    Map<String, dynamic> toJson() => {
        "BasinID": basinId,
        "Basin Name": basinName,
        "Subbasin Name": subbasinName,
        "Basin Acres": basinAcres,
        "Basin SqMiles": basinSqMiles,
        "Critical Overdraft": criticalOverdraft,
        "Irrigated Acres": irrigatedAcres,
        "Groundwater (Acre-feet)": groundwaterAcreFeet,
        "Groundwater AF_Acre": groundwaterAfAcre,
        "GW_of total supply": gwOfTotalSupply,
        "Declining GW Levels Points": decliningGwLevelsPoints,
        "GWL Decline Comments": gwlDeclineComments,
        "Subsidence Comments": subsidenceComments,
        "SGMA 2019 Basin Priority": sgma2019BasinPriority,
    };
}
