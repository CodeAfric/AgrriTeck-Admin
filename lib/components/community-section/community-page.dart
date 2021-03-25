import 'package:agriteck_admin/components/Common-widget/responsive_widget.dart';
import 'package:agriteck_admin/components/Common-widget/rounded_button.dart';
import 'package:agriteck_admin/components/Common-widget/search-bar.dart';
import 'package:agriteck_admin/components/community-section/community-card.dart';
import 'package:agriteck_admin/model-data/data-models.dart';
import 'package:agriteck_admin/other-classes/providers.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../Common-widget/section-title.dart';
import 'community-view.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  FToast fToast;
  @override
  void initState() {
    getUpdate();
    super.initState();
    fToast=FToast();
    fToast.init(context);
  }

  void getUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      List community =
          Provider.of<AppProviders>(context, listen: false).communityData;
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchDisease(community);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<AppProviders>(builder: (context, value, child) {
      List community = value.searchCommunity;
      List search = value.communityData;
      return Container(
          padding: EdgeInsets.only(top: 50, bottom: 5),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionTitle(
                  color: primary,
                  title: "Community",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 200,
                    child: RoundedButton(
                      color: primaryDark,
                      text: 'Ask Community',
                      textColor: Colors.white,
                      fontSize: 14,
                      horizontalPadding: 15,
                      press: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: width * 0.6,
                child: SearchBar(
                  onChange: (val) {
                    List<Diseases> newData = [];
                    setState(() {
                      if (val.isNotEmpty) {
                        search.forEach((element) {
                          if (element.name
                              .toString()
                              .toLowerCase()
                              .contains(val.toLowerCase())) {
                            newData.add(element);
                          }
                        });
                        Provider.of<AppProviders>(context, listen: false)
                            .updateSearchDisease(newData);
                      } else {
                        Provider.of<AppProviders>(context, listen: false)
                            .updateSearchDisease(search);
                      }
                    });
                  },
                  hint: "Search Post",
                )),
            ResponsiveWidget(
              tabletScreen: Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 20),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 30,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                    community.length,
                        (index) =>
                        CommunityCard(
                            index: index,
                            width: width * .35,
                            community: community[index],
                            ht: 410,
                            press: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return ViewCommunity(
                                    community: community[index],
                                  );
                                },
                              );
                            }),
                  ),
                ),
              ),
              desktopScreen: Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 20),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 30,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(
                    community.length,
                        (index) =>
                        CommunityCard(
                            index: index,
                            width: 380,
                            community: community[index],
                            ht: 410,
                            press: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return ViewCommunity(
                                    community: community[index],
                                  );
                                },
                              );
                            }),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 100),
          ]));
    });
  }
}
