import 'package:agriteck_admin/components/community-section/community-page.dart';
import 'package:agriteck_admin/components/home-page/home-page.dart';
import 'package:agriteck_admin/components/market/market-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'components/Common-widget/responsive_widget.dart';
import 'components/Common-widget/shape-painter.dart';
import 'components/Farmers/farmers-section.dart';
import 'components/NavigationBar/src/CompanyName.dart';
import 'components/NavigationBar/src/NavBarItem.dart';
import 'components/disease-section/disease-page.dart';
import 'components/farms-section/farms-page.dart';
import 'model-data/test-data.dart';
import 'other-classes/providers.dart';
import 'services/database-functions.dart';
import 'styles/app-colors.dart';

enum NavIcons {
  Home,
  Users,
  Farms,
  Diseases,
  Complaints,
  Community,
  Vendors,
  Investors,
  Market,
  Groups,
  Crops
}

class HomeScreen extends StatefulWidget {
  final NavIcons navIcons;
  HomeScreen({Key key, @required this.navIcons}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List farmers, diseases, farms, community;
  void generateData() async {
    diseases = ListGenerator.diseasesData();

    ///here we get the disease data
    farmers = ListGenerator.farmerList();

    ///here we get the farmer list
    farms = ListGenerator.farmsData(); //here we get farms data
    community = ListGenerator.communityData(); //here we get community data
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //this line is called because setState method before build method complete process of building widgets.
      ///here on this line , we update the two list of the disease,
      ///since we are not doing any search here, the search List will be the same as the main List.
      Provider.of<AppProviders>(context, listen: false).updateDisease(diseases);
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchDisease(diseases);

      ///here on this line , we update the two list of the farmers,
      ///since we are not doing any search here, the search List will be the same as the main List.
      Provider.of<AppProviders>(context, listen: false).updateFarmers(farmers);
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchFarmers(farmers);

      ///here on this line , we update the two list of the farms,
      ///since we are not doing any search here, the search List will be the same as the main List.
      Provider.of<AppProviders>(context, listen: false).updateFarm(farms);
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchFarms(farms);

      ///here on this line , we update the two list of the Community Information,
      ///since we are not doing any search here, the search List will be the same as the main List.
      Provider.of<AppProviders>(context, listen: false)
          .updateCommunity(community);
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchCommunity(community);
    });

    await readDiseases();
  }

  NavIcons navIco;

  ///here we  create a list of boolean variables
  ///this snippet will help us apply effect on the Navigation items when item is clicked
  List<bool> selected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  void select(int n) {
    for (int i = 0; i < 11; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

//----------------------------------------------------------------------------------------
  final ScrollController _scrollController = ScrollController();

  ///scroll Controller to help us regulate the vertical scroll bar
  @override
  void initState() {
    super.initState();
    generateData();
    navIco = widget.navIcons;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: deskTop(context),
      tabletScreen: tablet(context),
      mobileScreen: null,
    );
  }

  Widget deskTop(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: _height,
            width: _width,
            child: CustomPaint(
              painter: ShapePainter(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: _height,
            width: _width,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CompanyName(
                      height: 70,
                      fontSize: 45,
                    ),
                    SizedBox(width: 100),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              NavBarButton(
                                tex: "Home",
                                active: selected[0],
                                touched: () {
                                  setState(() {
                                    select(0);
                                    navIco = NavIcons.Home;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Farmers",
                                active: selected[1],
                                touched: () {
                                  setState(() {
                                    select(1);
                                    navIco = NavIcons.Users;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Farms",
                                active: selected[2],
                                touched: () {
                                  setState(() {
                                    select(2);
                                    navIco = NavIcons.Farms;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Diseases",
                                active: selected[3],
                                touched: () {
                                  setState(() {
                                    select(3);
                                    navIco = NavIcons.Diseases;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Co-operation",
                                active: selected[4],
                                touched: () {
                                  setState(() {
                                    select(4);
                                    navIco = NavIcons.Groups;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Vendors",
                                active: selected[5],
                                touched: () {
                                  setState(() {
                                    select(5);
                                    navIco = NavIcons.Vendors;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Investors",
                                active: selected[6],
                                touched: () {
                                  setState(() {
                                    select(6);
                                    navIco = NavIcons.Investors;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Market",
                                active: selected[7],
                                touched: () {
                                  setState(() {
                                    select(7);
                                    navIco = NavIcons.Market;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Crops",
                                active: selected[8],
                                touched: () {
                                  setState(() {
                                    select(8);
                                    navIco = NavIcons.Crops;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Community",
                                active: selected[9],
                                touched: () {
                                  setState(() {
                                    select(9);
                                    navIco = NavIcons.Community;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              NavBarButton(
                                tex: "Complaints",
                                active: selected[10],
                                touched: () {
                                  setState(() {
                                    select(10);
                                    navIco = NavIcons.Complaints;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 50, right: 20),
                  child: Scrollbar(
                    thickness: 10,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          navIco == NavIcons.Home ? HomePage() : Container(),
                          navIco == NavIcons.Farms ? FarmsPage() : Container(),
                          navIco == NavIcons.Users ? FarmersSection() : Container(),
                          navIco == NavIcons.Diseases ? DiseasePage() : Container(),
                          navIco == NavIcons.Community
                              ? CommunityPage()
                              : Container(),
                          navIco == NavIcons.Market ? MarketPage() : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //     body: Row(
      //   children: [
      //     Align(
      //       alignment: Alignment.centerLeft,
      //       child: Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: 250.0,
      //         color: primaryDark,
      //         child: Stack(
      //           children: [
      //             CompanyName(
      //               height: 70,
      //               fontSize: 45,
      //             ),
      //             Align(
      //               alignment: Alignment.center,
      //               child: Container(
      //                 margin: EdgeInsets.only(top: 100),
      //                 child: SingleChildScrollView(
      //                   child: Column(
      //                     children: [
      //                       NavBarItem(
      //                         icon: "assets/icons/home.png",
      //                         isHorizontal: false,
      //                         active: selected[0],
      //                         tex: "Home",
      //                         touched: () {
      //                           setState(() {
      //                             select(0);
      //                             navIco = NavIcons.Home;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/farmer.png",
      //                         isHorizontal: false,
      //                         active: selected[1],
      //                         tex: "Farmers",
      //                         touched: () {
      //                           setState(() {
      //                             select(1);
      //                             navIco = NavIcons.Users;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/farm.png",
      //                         active: selected[2],
      //                         isHorizontal: false,
      //                         tex: "Farms",
      //                         touched: () {
      //                           setState(() {
      //                             select(2);
      //                             navIco = NavIcons.Farms;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/pest.png",
      //                         isHorizontal: false,
      //                         active: selected[3],
      //                         tex: "Diseases",
      //                         touched: () {
      //                           setState(() {
      //                             select(3);
      //                             navIco = NavIcons.Diseases;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/community.png",
      //                         isHorizontal: false,
      //                         active: selected[4],
      //                         tex: "Co-operations",
      //                         touched: () {
      //                           setState(() {
      //                             select(4);
      //                             navIco = NavIcons.Diseases;
      //                           });
      //                         },
      //                       ),
      //
      //                       NavBarItem(
      //                         icon: "assets/icons/vendors.png",
      //                         active: selected[5],
      //                         isHorizontal: false,
      //                         tex: "Vendors",
      //                         touched: () {
      //                           setState(() {
      //                             select(5);
      //                             navIco = NavIcons.Vendors;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/investor.png",
      //                         active: selected[6],
      //                         isHorizontal: false,
      //                         tex: "Investors",
      //                         touched: () {
      //                           setState(() {
      //                             select(6);
      //                             navIco = NavIcons.Investors;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/market.png",
      //                         active: selected[7],
      //                         isHorizontal: false,
      //                         tex: "Market",
      //                         touched: () {
      //                           setState(() {
      //                             select(7);
      //                             navIco = NavIcons.Market;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/cultivate.png",
      //                         active: selected[8],
      //                         isHorizontal: false,
      //                         tex: "Crops",
      //                         touched: () {
      //                           setState(() {
      //                             select(8);
      //                             navIco = NavIcons.Investors;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/ask.png",
      //                         active: selected[9],
      //                         isHorizontal: false,
      //                         tex: "Community",
      //                         touched: () {
      //                           setState(() {
      //                             select(9);
      //                             navIco = NavIcons.Community;
      //                           });
      //                         },
      //                       ),
      //                       NavBarItem(
      //                         icon: "assets/icons/live-chat.png",
      //                         isHorizontal: false,
      //                         active: selected[10],
      //                         tex: "Complaints",
      //                         touched: () {
      //                           setState(() {
      //                             select(10);
      //                             navIco = NavIcons.Complaints;
      //                           });
      //                         },
      //                       ),
      //                      // Spacer(),
      //                       Align(
      //                           alignment: Alignment.bottomCenter,
      //                           child: Padding(
      //                             padding: const EdgeInsets.symmetric(vertical: 20),
      //                             child: Material(
      //                               color: Colors.transparent,
      //                               child: InkWell(
      //                                 onTap: () {
      //                                   showMaterialModalBottomSheet(
      //                                     context: context,
      //                                     backgroundColor: Colors.transparent,
      //                                     builder: (context) {
      //                                       return Container(
      //                                         color: primaryLight,
      //                                       );
      //                                     },
      //                                   );
      //                                 },
      //                                 child: Container(
      //                                   padding: EdgeInsets.only(top: 10, bottom: 10),
      //                                   child: ListTile(
      //                                     leading: Icon(
      //                                       FontAwesome.sign_out,
      //                                       size: 30,
      //                                       color: Colors.white,
      //                                     ),
      //                                     title: Text(
      //                                       "Settings | Login",
      //                                       style: TextStyle(
      //                                           color: Colors.white,
      //                                           fontSize: 18,
      //                                           fontWeight: FontWeight.w600,
      //                                           height: 1.5,
      //                                           wordSpacing: 2.5),
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           )),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //
      //           ],
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width - 300,
      //         padding: EdgeInsets.only(left: 50, right: 20),
      //         child: Scrollbar(
      //           thickness: 10,
      //           controller: _scrollController,
      //           child: SingleChildScrollView(
      //             controller: _scrollController,
      //             child: Column(
      //               children: [
      //                 navIco==NavIcons.Farms?FarmsPage():Container(),
      //                 navIco == NavIcons.Users ? FarmersSection() : Container(),
      //                 navIco==NavIcons.Diseases?DiseasePage():Container(),
      //                 navIco==NavIcons.Community?CommunityPage():Container(),
      //                 navIco==NavIcons.Market?MarketPage():Container(),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // )
    );
  }

  Widget tablet(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            color: primaryDark,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: [
                CompanyName(
                  height: 40,
                  fontSize: 20,
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          NavBarItem(
                            icon: "assets/icons/home.png",
                            isHorizontal: true,
                            active: selected[0],
                            tex: "Home",
                            touched: () {
                              setState(() {
                                select(0);
                                navIco = NavIcons.Home;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/farmer.png",
                            isHorizontal: true,
                            active: selected[1],
                            tex: "Farmers",
                            touched: () {
                              setState(() {
                                select(1);
                                navIco = NavIcons.Users;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/farm.png",
                            active: selected[2],
                            isHorizontal: true,
                            tex: "Farms",
                            touched: () {
                              setState(() {
                                select(2);
                                navIco = NavIcons.Farms;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/pest.png",
                            isHorizontal: true,
                            active: selected[3],
                            tex: "Diseases",
                            touched: () {
                              setState(() {
                                select(3);

                                navIco = NavIcons.Diseases;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/community.png",
                            active: selected[4],
                            isHorizontal: true,
                            tex: "Co-operation",
                            touched: () {
                              setState(() {
                                select(4);
                                navIco = NavIcons.Community;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/vendors.png",
                            active: selected[5],
                            isHorizontal: true,
                            tex: "Vendors",
                            touched: () {
                              setState(() {
                                select(5);
                                navIco = NavIcons.Vendors;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/investor.png",
                            active: selected[6],
                            isHorizontal: true,
                            tex: "Investors",
                            touched: () {
                              setState(() {
                                select(6);
                                navIco = NavIcons.Investors;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/market.png",
                            active: selected[7],
                            isHorizontal: true,
                            tex: "Market",
                            touched: () {
                              setState(() {
                                select(7);
                                navIco = NavIcons.Market;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/cultivate.png",
                            active: selected[8],
                            isHorizontal: true,
                            tex: "Crops",
                            touched: () {
                              setState(() {
                                select(8);
                                navIco = NavIcons.Investors;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/community.png",
                            active: selected[9],
                            isHorizontal: true,
                            tex: "Community",
                            touched: () {
                              setState(() {
                                select(9);
                                navIco = NavIcons.Community;
                              });
                            },
                          ),
                          NavBarItem(
                            icon: "assets/icons/live-chat.png",
                            isHorizontal: true,
                            active: selected[10],
                            tex: "Complaints",
                            touched: () {
                              setState(() {
                                select(10);
                                navIco = NavIcons.Complaints;
                              });
                            },
                          ),
                          Container(
                            width: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Material(
                              color: primaryLight,
                              child: InkWell(
                                onTap: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return Container(
                                        color: primaryLight,
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Icon(
                                    FontAwesome.sign_out,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 50,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 50, right: 20),
            child: Scrollbar(
              thickness: 10,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    navIco == NavIcons.Home ? HomePage() : Container(),
                    navIco == NavIcons.Farms ? FarmsPage() : Container(),
                    navIco == NavIcons.Users ? FarmersSection() : Container(),
                    navIco == NavIcons.Diseases ? DiseasePage() : Container(),
                    navIco == NavIcons.Community ? CommunityPage() : Container(),
                    navIco == NavIcons.Market ? MarketPage() : Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}




