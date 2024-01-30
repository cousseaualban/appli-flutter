import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp1appli/config/app_settings.dart';
import 'package:sp1appli/model/reservation.dart';

class ReservationViewModel extends ChangeNotifier {
  ReservationViewModel();

  // Get all reservation from API
  Future<List<Reservation>> getReservations() async {
    var token = AppSettings.APP_TOKEN;
    var uri = Uri.parse("http://172.16.178.129:8000/api/reservations");
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      List resJson = json.decode(response.body);
      print(resJson);
      return resJson.map((reservation) => new Reservation.fromJson(reservation))
          .toList();
    } else {
      throw Exception("Echec au chargement");
    }
  }

  // Delete a reservation with API call
  static Future<http.Response> deleteReservation(String id) async {
    var token = AppSettings.APP_TOKEN;
    final http.Response response = await http.delete(Uri.parse("http://172.16.178.129:8000/api/reservations/$id/delete"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer $token',
        });
    if(response.statusCode == 200){
      return response;
    } else  {
      throw Exception('Echec lors de la suppression de la réservation');
    }
  }
}