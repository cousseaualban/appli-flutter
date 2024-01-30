import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../config/app_settings.dart';
import '../../model/retiredcar.dart';


class RetiredcarViewModel extends ChangeNotifier{

  // Get all the retired cars
  Future<List<Retiredcar>> getRetiredcar() async {
    var token = AppSettings.APP_TOKEN;
    var uri = Uri.parse("http://172.16.178.129:8000/api/retiredCar");
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200) {
      List resJson = json.decode(response.body);
      print(resJson);
      return resJson.map((retiredcar) => new Retiredcar.fromJson(retiredcar)).toList();
    }else {
      throw Exception("Echec au chargement");
    }
  }

  // Delete a retired car
  static Future<http.Response> deleteRetiredcar(String id) async {
    var token = AppSettings.APP_TOKEN;
    final http.Response response = await http.delete(Uri.parse("http://172.16.178.129:8000/api/retiredCar/$id/delete"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer $token',
        });
    if(response.statusCode == 200){
      return response;
    } else  {
      throw Exception('Echec lors de la suppression de la voiture retirée');
    }
  }
}