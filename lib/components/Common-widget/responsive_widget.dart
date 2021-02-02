import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget tabletScreen;
  final Widget mobileScreen;

  const ResponsiveWidget(
      {Key key,
      @required this.desktopScreen,
      this.tabletScreen,
      this.mobileScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1300;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1300;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print("page===========${MediaQuery.of(context).size.width}");
        if (MediaQuery.of(context).size.width > 1100) {
          return desktopScreen;
        } else if (MediaQuery.of(context).size.width >= 800 &&
            MediaQuery.of(context).size.width <= 1100) {
          return tabletScreen ?? desktopScreen;
        } else {
          return mobileScreen ?? desktopScreen;
        }
      },
    );
  }
}
