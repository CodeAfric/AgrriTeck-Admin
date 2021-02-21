import 'package:flutter/material.dart';

class AppProviders with ChangeNotifier {
  bool isLoggedIn=false;

  ///here we have two list of farmers ,
  ///one will hold all the farmers and the other will hold filtered farmers after a search
  List farmerList,searchFarmer;
  ///one will hold all the Disease and the other will hold filtered disease after a search
  List diseasesData,searchDisease;

  void updateLogin(bool login) {
    isLoggedIn=login;
    notifyListeners();
  }

  ///this code help to update the two Disease List
  void updateFarmers(List mainData) {
    farmerList=mainData;
    notifyListeners();
  }
  void updateSearchFarmers(List filteredData) {
    searchFarmer=filteredData;
    notifyListeners();
  }
  //--------------------------------------------------------
  ///this code help to update the two Disease List
  void updateDisease(List mainData) {
    diseasesData=mainData;
    notifyListeners();
  }
  void updateSearchDisease(List filteredData) {
    searchDisease=filteredData;
    notifyListeners();
  }
//-----------------------------------------------------------
  bool get userState => isLoggedIn;
  ///After updating the two different list of farmers, we get the data with these getters
  List get getFarmerList=>farmerList;
  List get getSearchFarmer=>searchFarmer;
//----------------------------------------------------------------------------------------
  ///After updating the two different list of Disease, we get the data with these getters
  List get getDiseaseData=>diseasesData;
  List get getSearchDisease=>searchDisease;
  //-----------------------------------------------------------------------------------

}
