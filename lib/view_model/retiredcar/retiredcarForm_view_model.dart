import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/model/retiredcarform.dart';

class RetiredCarFormViewModel extends ChangeNotifier {
  RetiredCarFormViewModel();

  // Get all reservation from API
  Future<List<Retiredcarform>> getOneRetiredcarForm(String id) async {
    var token = AppSettings.APP_TOKEN;
    var uri = Uri.parse("http://172.16.178.129:8000/api/retiredCarForm/$id");
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      List resJson = json.decode(response.body);
      print(resJson);
      return resJson.map((retiredcarform) =>
      new Retiredcarform.fromJson(retiredcarform))
          .toList();
    } else {
      throw Exception("Echec au chargement");
    }
  }
}