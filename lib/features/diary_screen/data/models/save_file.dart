// To parse this JSON data, do
//
//     final saveFile = saveFileFromJson(jsonString);

import 'dart:convert';

SaveFile saveFileFromJson(String str) => SaveFile.fromJson(json.decode(str));

String saveFileToJson(SaveFile data) => json.encode(data.toJson());

class SaveFile {
  List<Datum> data;

  SaveFile({
    required this.data,
  });

  factory SaveFile.fromJson(Map<String, dynamic> json) => SaveFile(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String feelingName;
  String subFeelingName;
  String notes;
  double levelOfStress;
  double levelOfConfidence;
  DateTime createdDateTime;

  Datum({
    required this.feelingName,
    required this.subFeelingName,
    required this.notes,
    required this.levelOfStress,
    required this.levelOfConfidence,
    required this.createdDateTime,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    feelingName: json["feelingName"],
    subFeelingName: json["subFeelingName"],
    notes: json["notes"],
    levelOfStress: json["levelOfStress"]?.toDouble(),
    levelOfConfidence: json["levelOfConfidence"]?.toDouble(),
    createdDateTime: DateTime.parse(json["createdDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "feelingName": feelingName,
    "subFeelingName": subFeelingName,
    "notes": notes,
    "levelOfStress": levelOfStress,
    "levelOfConfidence": levelOfConfidence,
    "createdDateTime": createdDateTime.toIso8601String(),
  };
}
