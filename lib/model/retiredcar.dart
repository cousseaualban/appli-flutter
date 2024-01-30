// To parse this JSON data, do
//
//     final retiredcar = retiredcarFromJson(jsonString);

import 'dart:convert';

Retiredcar retiredcarFromJson(String str) => Retiredcar.fromJson(json.decode(str));

String retiredcarToJson(Retiredcar data) => json.encode(data.toJson());

class Retiredcar {
  Retiredcar({
    required this.id,
    required this.model,
    required this.licensePlate,
    required this.statusVehicle,
  });

  int id;
  String model;
  String licensePlate;
  String statusVehicle;

  factory Retiredcar.fromJson(Map<String, dynamic> json) => Retiredcar(
    id: json["id"],
    model: json["model"],
    licensePlate: json["licensePlate"],
    statusVehicle: json["statusVehicle"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model,
    "licensePlate": licensePlate,
    "statusVehicle": statusVehicle,
  };
}
