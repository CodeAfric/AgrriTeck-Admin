import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'home_screen.dart';
import 'other-classes/providers.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProviders()),
      ],
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriTeck',
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
      ),
      home: HomeScreen(
          navIcons: NavIcons.Home,
      ),
    );
  }
}
