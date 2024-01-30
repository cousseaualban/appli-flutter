import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp1appli/config/app_settings.dart';

import '../../model/profile.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel();

  // Get all reservation from API
  Future<List<Profile>> getProfile() async {
    var token = AppSettings.APP_TOKEN;
    var uri = Uri.parse("http://172.16.178.129:8000/api/users");
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      List resJson = json.decode(response.body);
      print(resJson);
      return resJson.map((profile) => new Profile.fromJson(profile))
          .toList();
    } else {
      throw Exception("Echec au chargement");
    }
  }
}