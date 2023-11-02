class Basin {
  final String BasinID;
  final String BasinName;
  final String SubbasinName;
  final double BasinAcres;
  final double BasinSqMiles;
  final String CriticalOverdraft;
  final num IrrigatedAcres;
  final num GroundwaterAcreFeet;
  final double GroundwaterAF_Acre;
  final num GW_of_total_supply;
  final double Declining_GW_Levels_Points;
  final String GWL_Decline_Comments;
  final String Subsidence_comments;
  final String SGMA_2019_Basin_Priority;

  Basin({
    required this.BasinID,
    required this.BasinName,
    required this.SubbasinName,
    required this.BasinAcres,
    required this.BasinSqMiles,
    required this.CriticalOverdraft,
    required this.IrrigatedAcres,
    required this.GroundwaterAcreFeet,
    required this.GroundwaterAF_Acre,
    required this.GW_of_total_supply,
    required this.Declining_GW_Levels_Points,
    required this.GWL_Decline_Comments,
    required this.Subsidence_comments,
    required this.SGMA_2019_Basin_Priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'Basin ID': BasinID,
      'Basin Name': BasinName,
      'Subbasin Name': SubbasinName,
      'Basin Acres': BasinAcres,
      'Basin SqMiles': BasinSqMiles,
      'Irrigated Acres': IrrigatedAcres,
      'Groundwater (Acre-feet)': GroundwaterAcreFeet,
      'Groundwater AF Per Acre': GroundwaterAF_Acre,
      'GW % of total supply': GW_of_total_supply,
      'Critical Overdraft': CriticalOverdraft,
      'Declining GW Levels Points': Declining_GW_Levels_Points,
      'GWL Decline Comments': GWL_Decline_Comments,
      'Subsidence Comments': Subsidence_comments,
      'SGMA 2019 Basin Priority': SGMA_2019_Basin_Priority,
    };
  }

  factory Basin.fromMap(Map<String, dynamic> map) {
    return Basin(
      BasinID: map['Basin ID'] ?? 'Unknown',
      BasinName: map['Basin Name'] ?? 'Unknown',
      SubbasinName: map['Subbasin Name'] ?? 'Unknown',
      BasinAcres: map['Basin Acres'] ?? 0,
      BasinSqMiles: map['Basin SqMiles'] ?? 0,
      CriticalOverdraft: map['Critical Overdraft'] ?? 0,
      IrrigatedAcres: map['Irrigated Acres'] ?? 0,
      GroundwaterAcreFeet: map['Groundwater (Acre-feet)'] ?? 0,
      GroundwaterAF_Acre: map['Groundwater AF_Acre'] ?? 0,
      GW_of_total_supply: map['GW_of total supply'] ?? 0,
      Declining_GW_Levels_Points: map['Declining GW Levels Points'] ?? 0,
      GWL_Decline_Comments: map['GWL Decline Comments'] ?? 'Unknown',
      Subsidence_comments: map['Subsidence Comments'] ?? 'Unknown',
      SGMA_2019_Basin_Priority: map['SGMA 2019 Basin Priority'] ?? 'Unknown',
    );
  }
}
