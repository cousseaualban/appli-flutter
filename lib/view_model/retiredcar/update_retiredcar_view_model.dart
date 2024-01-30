import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../config/app_settings.dart';


class UpdateRetiredCarViewModel extends ChangeNotifier {
  UpdateRetiredCarViewModel();

  // Update a reservation
  Future updateRetiredcar(String id, String model, String licensePlate, String statusVehicle) async {
    try{
      var token = AppSettings.APP_TOKEN;
      var uri = Uri.parse("http://172.16.178.129:8000/api/retiredCar/update/$id");
      var resJson;
      var response = await http.post(uri, headers:
      {
        'Accept':'application/json',
        'Authorization' : 'Bearer $token',
      },
          body: {
            "model": "$model",
            "licensePlate": "$licensePlate",
            "statusVehicle": "$statusVehicle",
          });

      if(response.statusCode == 200){
        resJson = json.decode(response.body);
        print(resJson);
      }else{
        print("Modification non réussie");
      }
    } catch (e){
      return e.toString();
    }

  }
}