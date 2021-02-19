import 'package:flutter/material.dart';

class AppProviders with ChangeNotifier {
  bool isLoggedIn=false;
  String floatingFrom="none";
  void updateLogin(bool login) {
    isLoggedIn=login;
    notifyListeners();
  }
  void updateFloating(String from) {
    floatingFrom=from;
    notifyListeners();
  }

  bool get userState => isLoggedIn;
  String get floating=>floatingFrom;
}
