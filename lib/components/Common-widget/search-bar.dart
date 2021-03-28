import 'package:agriteck_admin/home_screen.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  final NavIcons page;
  const SearchBar({Key key, this.page})
      : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProviders>(
        builder: (context, value, child) {
          List diseases =value.diseasesData;
          List farmers =value.farmerList;
          List farms = value.farmsData;
          List market = value.marketData;
          List community = value.communityData;
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: primary.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        if (widget.page == NavIcons.Diseases) {
                          List<Diseases> newData = [];
                            if (value.isNotEmpty) {
                              diseases.forEach((element) {
                                if (element.name
                                    .toString()
                                    .toLowerCase()
                                    .contains(value.toLowerCase())) {
                                  newData.add(element);
                                }
                              });
                              Provider.of<AppProviders>(context, listen: false)
                                  .updateSearchDisease(newData);
                            } else {
                              Provider.of<AppProviders>(context, listen: false)
                                  .updateSearchDisease(diseases);
                            }
                        }else if(widget.page == NavIcons.Farms){
                          List<Farms> newData = [];
                          if (value.isNotEmpty) {
                            farms.forEach((element) {
                              if (element.farmId
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                                  element.farmerId
                                      .toString()
                                      .toLowerCase()
                                      .contains(value.toLowerCase()) ||
                                  element.location.toString().toLowerCase().contains(value.toLowerCase())) {
                                newData.add(element);
                              }
                            });
                            Provider.of<AppProviders>(context, listen: false)
                                .updateSearchFarms(newData);
                          } else {
                            Provider.of<AppProviders>(context, listen: false)
                                .updateSearchFarms(farms);
                          }
                        }
                        else if(widget.page == NavIcons.Users){
                          List<Farmers> newData=[];
                            if(value.isNotEmpty){
                              farmers.forEach((element) {
                                if(element.name.toString().toLowerCase().contains(value.toLowerCase())||
                                    element.location.toString().toLowerCase().contains(value.toLowerCase())||
                                    element.specialized.toString().toLowerCase().contains(value.toLowerCase())){
                                  newData.add(element);
                                }
                              });
                              Provider.of<AppProviders>(context, listen: false).updateSearchFarmers(newData);
                            }else{
                              Provider.of<AppProviders>(context, listen: false).updateSearchFarmers(farmers);
                            }
                        }else if(widget.page == NavIcons.Market){
                          List<Market> newData=[];
                          if(value.isNotEmpty){
                            market.forEach((element) {
                              if(element.productName.toString().toLowerCase().contains(value.toLowerCase())||
                                  element.timeStamp.toString().toLowerCase().contains(value.toLowerCase())||
                                  element.farmer['name'].toString().toLowerCase().contains(value.toLowerCase())||
                                  element.productDescription.toString().toLowerCase().contains(value.toLowerCase())){
                                newData.add(element);
                              }
                            });
                            Provider.of<AppProviders>(context, listen: false).updateSearchMarket(newData);
                          }else{
                            Provider.of<AppProviders>(context, listen: false).updateSearchMarket(market);
                          }
                        }
                      });
                    },
                    decoration: InputDecoration(
                      hintText: widget.page == NavIcons.Farms
                          ? 'Search a Farm'
                          : widget.page == NavIcons.Community
                          ? 'Search for a Post'
                          : widget.page == NavIcons.Users
                          ? 'Search for a Farmer'
                          : widget.page == NavIcons.Market
                          ? 'Search for a Product'
                          : widget.page == NavIcons.Diseases
                          ? 'Search a Disease'
                          : widget.page == NavIcons.Crops
                          ? 'Search for a Crop'
                          : widget.page == NavIcons.Vendors
                          ? 'Search for a Vendor'
                          : widget.page == NavIcons.Investors
                          ? 'Search for an Investor'
                          : widget.page ==
                          NavIcons.Complaints
                          ? 'Search for a Complain'
                          : widget.page ==
                          NavIcons.Groups
                          ? 'Search for a Group'
                          : '',
                      hintStyle: TextStyle(
                          color: primary.withOpacity(0.7),
                          fontWeight: FontWeight.bold),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      //suffixIcon: SvgPicture.asset("assets/icons/search.svg",color: primary,),
                    ),
                  ),
                ),
                Icon(
                  FontAwesome.search,
                  color: primary.withOpacity(0.7),
                  size: 20,
                )
              ],
            ),
          );
        }
    );

  }

  searchData(BuildContext context, String value) {
    List diseases =
        Provider.of<AppProviders>(context, listen: false).diseasesData;
    List farmers = Provider.of<AppProviders>(context, listen: false).farmerList;
    List farms = Provider.of<AppProviders>(context, listen: false).farmsData;
    List market = Provider.of<AppProviders>(context, listen: false).marketData;
    List community =
        Provider.of<AppProviders>(context, listen: false).communityData;
    if (widget.page == NavIcons.Diseases) {
      List<Diseases> newData = [];
      setState(() {
        if (value.isNotEmpty) {
          diseases.forEach((element) {
            if (element.name
                .toString()
                .toLowerCase()
                .contains(value.toLowerCase())) {
              newData.add(element);
            }
          });
          Provider.of<AppProviders>(context, listen: false)
              .updateSearchDisease(newData);
        } else {
          Provider.of<AppProviders>(context, listen: false)
              .updateSearchDisease(diseases);
        }
      });
    }
  }
}
