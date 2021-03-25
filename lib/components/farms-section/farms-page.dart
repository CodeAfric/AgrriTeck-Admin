import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/search-bar.dart';
import 'package:agriteck_admin/components/farms-section/farms-card.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../Common-widget/section-title.dart';
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

  void getUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List farms = Provider.of<AppProviders>(context, listen: false).farmsData;
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchFarms(farms);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<AppProviders>(builder: (context, value, child) {
      List farms = value.searchFarm;
      List search = value.farmsData;
      return Container(
        padding: EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          children: [
            // SectionTitle(
            //   color: primary,
            //   title: "Farms Trucking",
            // ),
            SizedBox(
                width: width * 0.6,
                child: SearchBar(
                  onChange: (val) {
                    List<Farms> newData = [];
                    setState(() {
                      if (val.isNotEmpty) {
                        search.forEach((element) {
                          if (element.farmId
                                  .toString()
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              element.farmerId
                                  .toString()
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              element.location.toString().toLowerCase().contains(val.toLowerCase())) {
                            newData.add(element);
                          }
                        });
                        Provider.of<AppProviders>(context, listen: false)
                            .updateSearchFarms(newData);
                      } else {
                        Provider.of<AppProviders>(context, listen: false)
                            .updateSearchFarms(search);
                      }
                    });
                  },
                  hint: "Search Farm",
                )),
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
                        ht: 450,
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
                        width: 380,
                        farms: farms[index],
                        ht: 450,
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
            ),
            SizedBox(height: 100),
          ],
        ),
      );
    });
  }
}
