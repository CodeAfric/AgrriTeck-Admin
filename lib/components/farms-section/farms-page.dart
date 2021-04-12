import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/farms-section/farms-card.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/services/database-services.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'farm-view.dart';

class FarmsPage extends StatefulWidget {
  @override
  _FarmsPagePageState createState() => _FarmsPagePageState();
}

class _FarmsPagePageState extends State<FarmsPage> {
  @override
  void initState() {
    getUpdate();
    super.initState();
  }

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  void getUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List farms = Provider.of<AppProviders>(context, listen: false).farmsData;
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchFarms(farms);
    });
  }

  getData() async {
    List farmList;
    var snapshot = await DatabaseServices.getDataFromDatabase('Farmers');

    farmList = snapshot.docs.toList();
    return farmList;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var _asyncLoader = new AsyncLoader(
      // var farm = Farms.fromMapObject(data[index].data());
      key: _asyncLoaderState,
      initState: () async => getData(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Center(
        child: new Text('Sorry, there was an error loading your Information'),
      ),
      renderSuccess: ({data}) => Wrap(
        spacing: 15,
        runSpacing: 40,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(
          data.length,
          (index) {
            var farm = Farms.fromMapObject(data[index].data());
            return FarmsCard(
              index: index,
              width: 380,
              farms: farm,
              ht: 460,
              press: () {
                showMaterialModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return ViewFarm(
                      farms: farm,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
    return Consumer<AppProviders>(builder: (context, value, child) {
      List farms = value.searchFarm;
      List search = value.farmsData;
      return Container(
        padding: EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          children: [
            ResponsiveWidget(
              tabletScreen: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 40,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                    farms.length,
                    (index) => FarmsCard(
                        index: index,
                        width: width * .38,
                        farms: farms[index],
                        ht: 460,
                        press: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return ViewFarm(
                                farms: farms[index],
                              );
                            },
                          );
                        }),
                  ),
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
