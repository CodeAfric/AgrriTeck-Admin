import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Farmers/farmers-card.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FarmersSection extends StatefulWidget {
  @override
  _FarmersSectionState createState() => _FarmersSectionState();
}

class _FarmersSectionState extends State<FarmersSection> {
  void getUpdate(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List farmers= Provider.of<AppProviders>(context, listen: false).farmerList;
      Provider.of<AppProviders>(context, listen: false).updateSearchFarmers(farmers);
    });
  }
  @override
  void initState() {
    getUpdate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<AppProviders>(
        builder: (context, value, child) {
          List farmerList = value.searchFarmer;
          List search = value.farmerList;
          return Container(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Column(
              children: [
                ResponsiveWidget(
                  tabletScreen: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Wrap(
                      spacing: 25,
                      runSpacing: 45,
                      alignment: WrapAlignment.spaceAround,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: List.generate(
                          farmerList.length,
                              (index) =>
                              FarmerCard(height: 310,
                                width: 330,
                                imageSize: 90,
                                farmers: farmerList[index],)
                      ),
                    ),
                  ),
                  desktopScreen: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Wrap(
                      spacing: 25,
                      runSpacing: 45,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(
                          farmerList.length,
                              (index) =>
                              FarmerCard(height: 310,
                                width: 330,
                                imageSize: 90,
                                farmers: farmerList[index],)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          );

        }
    );
  }
}
