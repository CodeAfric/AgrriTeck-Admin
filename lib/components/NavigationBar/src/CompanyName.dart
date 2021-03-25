import 'package:flutter/material.dart';

import '../../../styles/app-colors.dart';
class CompanyName extends StatelessWidget {
  final double fontSize;
  final double height;
  CompanyName({Key key, @required this.fontSize, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(29),
          bottomRight: Radius.circular(29),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 0,
            color: primary.withOpacity(.5),
          ),
        ],
      ),
      height: height,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(color: primaryDark, fontSize: fontSize),
                children: [
                  TextSpan(
                      text: "Agri",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: primaryLight)),
                  TextSpan(
                    text: "Teck",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
