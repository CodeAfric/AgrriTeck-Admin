import 'package:agriteck_admin/components/NavigationBar/src/NavBarItem.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriTeck',
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(
          navIcons: NavIcons.Home,
      ),
    );
  }
}
