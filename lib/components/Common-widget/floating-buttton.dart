import 'package:flutter/material.dart';
import 'package:agriteck_admin/styles/app-colors.dart';

class FloatingButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressHandler;

  const FloatingButton({
    this.label,
    this.icon,
    this.onPressHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: FloatingActionButton.extended(
        onPressed: this.onPressHandler,
        label: Text(this.label),
        icon: Icon(
          this.icon,
        ),
        backgroundColor: primaryDark,
        elevation: 10.0,
      ),
    );
  }
}
