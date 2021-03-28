import 'package:flutter/material.dart';

class AppProviders with ChangeNotifier {
  bool isLoggedIn=false;

  ///here we have two list of farmers ,
  ///one will hold all the farmers and the other will hold filtered farmers after a search
  List farmerList,searchFarmer;
  ///one will hold all the Disease and the other will hold filtered disease after a search
  List diseasesData,searchDisease;
  ///one will hold all the farm and the other will hold filtered farms after a search
  List farmsData,searchFarm;
  ///one will hold all the community data(Questions Asked) and the other will hold filtered farms after a search
  List communityData,searchCommunity;

  List marketData,searchProduct;
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
  ///this code help to update the two Farms List
  void updateFarm(List mainData) {
    farmsData=mainData;
    notifyListeners();
  }
  void updateSearchFarms(List filteredData) {
    searchFarm=filteredData;
    notifyListeners();
  }

  //-----------------------------------------------------------
  ///this code help to update the two Community List
  void updateCommunity(List mainData) {
    communityData=mainData;
    notifyListeners();
  }
  void updateSearchCommunity(List filteredData) {
    searchCommunity=filteredData;
    notifyListeners();
  }

  //-----------------------------------------------------------
  ///this code help to update the two Community List
  void updateMarket(List mainData) {
    marketData=mainData;
    notifyListeners();
  }
  void updateSearchMarket(List filteredData) {
    searchProduct=filteredData;
    notifyListeners();
  }
  bool get userState => isLoggedIn;
  ///After updating the two different list of farmers, we get the data with these getters
  List get getFarmerList=>farmerList;
  List get getSearchFarmer=>searchFarmer;
//----------------------------------------------------------------------------------------
  ///After updating the two different list of Disease, we get the data with these getters
  List get getDiseaseData=>diseasesData;
  List get getSearchDisease=>searchDisease;
  //-----------------------------------------------------------------------------------
  ///After updating the two different list of farms, we get the data with these getters
  List get getFarmData=>farmsData;
  List get getSearchFarm=>searchFarm;
//-----------------------------------------------------------------------------------
  ///After updating the two different list of farms, we get the data with these getters
  List get getCommunityData=>communityData;
  List get getSearchCommunity=>searchCommunity;
//-----------------------------------------------------------------------------------

  ///After updating the two different list of farms, we get the data with these getters
  List get getMarketData=>marketData;
  List get getSearchProducts=>searchProduct;
//-----------------------------------------------------------------------------------


}
