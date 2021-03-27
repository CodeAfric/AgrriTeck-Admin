import 'package:agriteck_admin/components/community-section/community-page.dart';
import 'package:agriteck_admin/components/home-page/home-page.dart';
import 'package:agriteck_admin/components/market/market-page.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'components/Common-widget/responsive_widget.dart';
import 'components/Common-widget/search-bar.dart';
import 'components/Common-widget/shape-painter.dart';
import 'components/Farmers/farmers-section.dart';
import 'components/NavigationBar/src/CompanyName.dart';
import 'components/NavigationBar/src/NavBarItem.dart';
import 'components/disease-section/disease-page.dart';
import 'components/farms-section/farms-page.dart';
import 'model-data/test-data.dart';
import 'other-classes/providers.dart';
import 'services/database-functions.dart';

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
  List farmers, diseases, farms, community, market;
  void generateData() async {
    diseases = ListGenerator.diseasesData();

    ///here we get the disease data
    farmers = ListGenerator.farmerList();

    ///here we get the farmer list
    farms = ListGenerator.farmsData(); //here we get farms data
    community = ListGenerator.communityData(); //here we get community data
    ///here we get the maket data
    market = ListGenerator.marketData();

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

      ///here on this line , we update the two list of the farms,
      ///since we are not doing any search here, the search List will be the same as the main List.
      Provider.of<AppProviders>(context, listen: false).updateMarket(market);
      Provider.of<AppProviders>(context, listen: false)
          .updateSearchMarket(market);

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
  String selectedVal = "Home";
  bool isSearching = false;
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
    generateData();
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
                    SizedBox(width: 50),
                    isSearching
                        ? SizedBox(
                            width: _width * 0.5,
                            child: SearchBar(
                              page: navIco,
                            ),
                          )
                        : Container(
                          width: _width*.68,
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
                    Spacer(),
                    navIco==NavIcons.Home?Container():
                    IconButton(
                        icon: Icon(
                          !isSearching ? Icons.search : Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            generateData();
                            isSearching = isSearching ? false : true;
                          });
                        }),
                    SizedBox(
                      width: 10,
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
                          navIco == NavIcons.Users
                              ? FarmersSection()
                              : Container(),
                          navIco == NavIcons.Diseases
                              ? DiseasePage()
                              : Container(),
                          navIco == NavIcons.Community
                              ? CommunityPage()
                              : Container(),
                          navIco == NavIcons.Market
                              ? MarketPage()
                              : Container(),
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
    );
  }

  Widget tablet(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    generateData();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CompanyName(
                      height: 70,
                      fontSize: 45,
                    ),
                    navIco==NavIcons.Home?Container():
                    SizedBox(
                      width: _width * 0.45,
                      child: SearchBar(
                        page: navIco,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: PopupMenuButton<NavIcons>(
                            child: Material(
                                color: Colors.transparent,
                                child: HoverWidget(
                                  hoverChild: Text(
                                    selectedVal,
                                    style: TextStyle(
                                        color: primaryDark,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "SF Pro Display",
                                        fontSize: 20),
                                  ),
                                  onHover: (event) {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.menu,
                                        color: primaryDark,
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            selectedVal,
                                            style: TextStyle(
                                                color: primaryDark,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "SF Pro Display",
                                                fontSize: 22),
                                          ),
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 475),
                                            height: 3.0,
                                            width: 25.0,
                                            decoration: BoxDecoration(
                                              color: primaryDark,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            onSelected: (value) {
                              setState(() {
                                navIco = value;
                                selectedVal = value == NavIcons.Home
                                    ? "Home"
                                    : value == NavIcons.Farms
                                        ? "Farms"
                                        : value == NavIcons.Users
                                            ? "Farmers"
                                            : value == NavIcons.Market
                                                ? "Market"
                                                : value == NavIcons.Diseases
                                                    ? "Disease"
                                                    : value == NavIcons.Crops
                                                        ? "Crops"
                                                        : value ==
                                                                NavIcons.Groups
                                                            ? "Co-operations"
                                                            : value ==
                                                                    NavIcons
                                                                        .Investors
                                                                ? "Investors"
                                                                : value ==
                                                                        NavIcons
                                                                            .Vendors
                                                                    ? "Vendors"
                                                                    : value ==
                                                                            NavIcons
                                                                                .Complaints
                                                                        ? "Complaints"
                                                                        : value ==
                                                                                NavIcons.Community
                                                                            ? "Community"
                                                                            : "";
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry<NavIcons>>[
                                PopupMenuItem(
                                  child: Text('Home'),
                                  value: NavIcons.Home,
                                ),
                                PopupMenuItem(
                                  child: Text('Farmers'),
                                  value: NavIcons.Users,
                                ),
                                PopupMenuItem(
                                  child: Text('Farms'),
                                  value: NavIcons.Farms,
                                ),
                                PopupMenuItem(
                                  child: Text('Diseases'),
                                  value: NavIcons.Diseases,
                                ),
                                PopupMenuItem(
                                  child: Text('Co-operations'),
                                  value: NavIcons.Groups,
                                ),
                                PopupMenuItem(
                                  child: Text('Vendors'),
                                  value: NavIcons.Vendors,
                                ),
                                PopupMenuItem(
                                  child: Text('Investors'),
                                  value: NavIcons.Investors,
                                ),
                                PopupMenuItem(
                                  child: Text('Market'),
                                  value: NavIcons.Market,
                                ),
                                PopupMenuItem(
                                  child: Text('Crops'),
                                  value: NavIcons.Crops,
                                ),
                                PopupMenuItem(
                                  child: Text('Community'),
                                  value: NavIcons.Community,
                                ),
                                PopupMenuItem(
                                  child: Text('Complaints'),
                                  value: NavIcons.Complaints,
                                )
                              ];
                            }))
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
                          navIco == NavIcons.Users
                              ? FarmersSection()
                              : Container(),
                          navIco == NavIcons.Diseases
                              ? DiseasePage()
                              : Container(),
                          navIco == NavIcons.Community
                              ? CommunityPage()
                              : Container(),
                          navIco == NavIcons.Market
                              ? MarketPage()
                              : Container(),
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
    );
  }
}
