import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String text;
  final Function press;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final Color color;
  final Color textColor;
  final bool isLoading;
  RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor,
    this.verticalPadding = 10,
    this.horizontalPadding = 20,
    this.fontSize = 16,
    this.isLoading=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding:
            EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 30,
              color: Color(0xFF666666).withOpacity(.11),
            ),
          ],
        ),
        child:isLoading==null?false:isLoading ?
        Image.asset(
          'assets/icons/spinner.gif',
          width: 19.0,
          height: 19.0,
        ) : Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor
          ),
        ),
      ),
    );
  }
}
