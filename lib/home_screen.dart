import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'components/Common-widget/responsive_widget.dart';
import 'components/NavigationBar/src/CompanyName.dart';
import 'components/NavigationBar/src/NavBarItem.dart';
import 'styles/app-colors.dart';

enum NavIcons { Home, Users, Farms, Diseases, Complaints, Post }

class HomeScreen extends StatefulWidget {
  final NavIcons navIcons;
  HomeScreen({Key key, @required this.navIcons}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavIcons navIco;
  List<bool> selected = [true, false, false, false, false, false];
  void select(int n) {
    for (int i = 0; i < 6; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
        body: Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: 250.0,
            color: primaryDark,
            child: Stack(
              children: [
                CompanyName(
                  height: 70,
                  fontSize: 45,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 450.0,
                    child: Column(
                      children: [
                        NavBarItem(
                          icon: FontAwesome.home,
                          isHorizontal: false,
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
                          icon: FontAwesome.users,
                          isHorizontal: false,
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
                          icon: FontAwesome.sitemap,
                          active: selected[2],
                          isHorizontal: false,
                          tex: "Farms",
                          touched: () {
                            setState(() {
                              select(2);
                              navIco = NavIcons.Farms;
                            });
                          },
                        ),
                        NavBarItem(
                          icon: FontAwesome.ils,
                          isHorizontal: false,
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
                          icon: FontAwesome.comment,
                          isHorizontal: false,
                          active: selected[4],
                          tex: "Complaints",
                          touched: () {
                            setState(() {
                              select(4);
                              navIco = NavIcons.Complaints;
                            });
                          },
                        ),
                        NavBarItem(
                          icon: Icons.info,
                          active: selected[5],
                          isHorizontal: false,
                          tex: "Post",
                          touched: () {
                            setState(() {
                              select(5);
                              navIco = NavIcons.Post;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Material(
                        color: Colors.transparent,
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
                            child: ListTile(
                              leading: Icon(
                                FontAwesome.sign_out,
                                size: 30,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Settings | Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    wordSpacing: 2.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width - 300,
            padding: EdgeInsets.only(left: 50, right: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpeg"),
              ),
            ),
            child: Scrollbar(
              thickness: 10,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // navIco == NavIcons.Home ? HomeSection() : Container(),
                    // navIco == NavIcons.About ? AboutSection() : Container(),
                    // navIco == NavIcons.Services
                    //     ? ServiceSection()
                    //     : Container(),
                    // navIco == NavIcons.Potfolio
                    //     ? RecentWorkSection()
                    //     : Container(),
                    // navIco == NavIcons.Blog ? FeedbackSection() : Container(),
                    // navIco == NavIcons.Contacts
                    //     ? ContactSection()
                    //     : Container(),
                    // HomeSection(),
                    // AboutSection(),
                    // ServiceSection(),
                    // RecentWorkSection(),
                    //FeedbackSection(),
                    // SizedBox(height: kDefaultPadding),
                    // ContactSection(),
                    //This SizeBox just for demo
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
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
                Spacer(),
                NavBarItem(
                  icon: FontAwesome.home,
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
                  icon: FontAwesome.users,
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
                  icon: FontAwesome.sitemap,
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
                  icon: FontAwesome.ils,
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
                  icon: FontAwesome.comment,
                  isHorizontal: true,
                  active: selected[4],
                  tex: "Complaints",
                  touched: () {
                    setState(() {
                      select(4);
                      navIco = NavIcons.Complaints;
                    });
                  },
                ),
                NavBarItem(
                  icon: Icons.info,
                  active: selected[5],
                  isHorizontal: true,
                  tex: "Post",
                  touched: () {
                    setState(() {
                      select(5);
                      navIco = NavIcons.Post;
                    });
                  },
                ),
                Spacer(),
                Container(
                  width: 90,
                  child: Material(
                    color: Colors.transparent,
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
                    // navIco == NavIcons.Home ? HomeSection() : Container(),
                    // navIco == NavIcons.About ? AboutSection() : Container(),
                    // navIco == NavIcons.Services
                    //     ? ServiceSection()
                    //     : Container(),
                    // navIco == NavIcons.Potfolio
                    //     ? RecentWorkSection()
                    //     : Container(),
                    // navIco == NavIcons.Blog ? FeedbackSection() : Container(),
                    // navIco == NavIcons.Contacts
                    //     ? ContactSection()
                    //     : Container(),
                    // HomeSection(),
                    // AboutSection(),
                    // ServiceSection(),
                    // RecentWorkSection(),
                    //FeedbackSection(),
                    // SizedBox(height: kDefaultPadding),
                    // ContactSection(),
                    //This SizeBox just for demo
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
