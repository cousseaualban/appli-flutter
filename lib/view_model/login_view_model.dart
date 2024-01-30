import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginViewModel extends ChangeNotifier {
LoginViewModel();

  Future<bool> signInButtonOnClickCommand(String email, String password) async {
    bool isConnected = false;
    String url = "http://172.16.178.129:8000/api/login";
    Map body = {"email": email, "password": password};
    var jsonResponse;
    var response = await http.post(Uri.parse(url), body: body);

    //API status
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      isConnected = true;

      print('toto status: ${response.statusCode}');
      print('toto body: ${response.body}');

    }else{
      isConnected = false;
    }
    print('LoginViewModel - signInButtonOnClickCommand()');
    print('Email : ${email} / Password : ${password} ');
    print(isConnected);

    return isConnected;
    }
  }