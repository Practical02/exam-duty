import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? jwt;

  void setJwt(String token) {
    jwt = token;
    notifyListeners();
  }
}
