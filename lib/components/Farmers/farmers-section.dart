import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Farmers/farmers-card.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/services/database-services.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmersSection extends StatefulWidget {
  @override
  _FarmersSectionState createState() => _FarmersSectionState();
}

class _FarmersSectionState extends State<FarmersSection> {
  void getUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List farmers =
          Provider.of<AppProviders>(context, listen: false).farmerList;
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchFarmers(farmers);
    });
  }

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  getData() async {
    List farmList;
    var snapshot = await DatabaseServices.getDataFromDatabase('Farmers');

    farmList = snapshot.docs.toList();
    return farmList;
  }

  @override
  void initState() {
    getUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => getData(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Center(
        child: new Text('Sorry, there was an error loading your Information'),
      ),
      renderSuccess: ({data}) => Wrap(
        spacing: 25,
        runSpacing: 45,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(data.length, (index) {
          var farmer = Farmers.fromMapObject(data[index].data());
          return FarmerCard(
            height: 310,
            width: 330,
            imageSize: 90,
            farmers: farmer,
          );
        }),
      ),
    );
    return Consumer<AppProviders>(builder: (context, value, child) {
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
                      (index) => FarmerCard(
                            height: 310,
                            width: 330,
                            imageSize: 90,
                            farmers: farmerList[index],
                          )),
                ),
              ),
              desktopScreen: Padding(
                  padding: const EdgeInsets.only(top: 50), child: _asyncLoader),
            ),
            SizedBox(height: 100),
          ],
        ),
      );
    });
  }
}
