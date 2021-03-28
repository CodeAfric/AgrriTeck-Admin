import 'package:agriteck_admin/components/community-section/community-page.dart';
import 'package:agriteck_admin/components/home-page/home-page.dart';
import 'package:agriteck_admin/components/market/market-page.dart';
import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'components/Common-widget/floating-buttton.dart';
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
  ScrollController _controller;
  final itemSize = 100.0;
  bool scrollRight = true;
  bool scrollLeft = false;
  List<Map<String, dynamic>> navigationItem = [
    {'label': "Home", 'navIco': NavIcons.Home},
    {'label': "Farmers", 'navIco': NavIcons.Users},
    {'label': "Farms", 'navIco': NavIcons.Farms},
    {'label': "Diseases", 'navIco': NavIcons.Diseases},
    {'label': "Vendors", 'navIco': NavIcons.Vendors},
    {'label': "Investors", 'navIco': NavIcons.Investors},
    {'label': "Market", 'navIco': NavIcons.Market},
    {'label': "Crops", 'navIco': NavIcons.Crops},
    {'label': "Community", 'navIco': NavIcons.Community},
    {'label': "Complaints", 'navIco': NavIcons.Complaints}
  ];
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
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        scrollRight = false;
      });
    } else {
      setState(() {
        scrollRight = true;
      });
    }

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

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        scrollRight = false;
      });
    } else {
      setState(() {
        scrollRight = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        scrollLeft = false;
      });
    } else {
      setState(() {
        scrollLeft = true;
      });
    }
  }

//----------------------------------------------------------------------------------------
  final ScrollController _scrollController = ScrollController();

  ///scroll Controller to help us regulate the vertical scroll bar
  String selectedVal = "Home";
  bool isSearching = false;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
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

  _moveUp() {
    _controller.animateTo(_controller.offset - itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    _controller.animateTo(_controller.offset + itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  Widget deskTop(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    generateData();
    return Scaffold(
      floatingActionButton: navIco == NavIcons.Diseases
          ? FloatingButton(
              label: 'Train Model',
              icon: Icons.thumb_up,
              onPressHandler: () {},
            )
          : navIco == NavIcons.Community
              ? FloatingButton(
                  label: 'Ask Community',
                  icon: Icons.thumb_up,
                  onPressHandler: () {},
                )
              : null,
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
                    scrollLeft && !isSearching
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: primary,
                                ),
                                onPressed: _moveUp),
                          )
                        : Text(''),
                    isSearching
                        ? SizedBox(
                            width: _width * 0.5,
                            child: SearchBar(
                              page: navIco,
                            ),
                          )
                        : Container(
                            width: _width * .6,
                            height: 30,
                            padding: EdgeInsets.only(right: 40),
                            child: ListView.builder(
                              controller: _controller,
                              itemCount: navigationItem.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Container(
                                    child: NavBarButton(
                                      tex: navigationItem[index]['label'],
                                      active: selected[index],
                                      touched: () {
                                        setState(() {
                                          select(index);
                                          navIco =
                                              navigationItem[index]['navIco'];
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        scrollRight && !isSearching
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: primary,
                                    ),
                                    onPressed: _moveDown),
                              )
                            : Text(''),
                        navIco == NavIcons.Home
                            ? Container()
                            : IconButton(
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
                      ],
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20, right: 20),
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
                    navIco == NavIcons.Home
                        ? Container()
                        : SizedBox(
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
