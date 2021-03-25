import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(BuildContext context, FToast fToast, IconData iconData,
    Color color, String message) {
 Widget toast = Container(
  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
  decoration: BoxDecoration(
   borderRadius: BorderRadius.circular(25.0),
   color: color,
  ),
  child: Row(
   mainAxisSize: MainAxisSize.min,
   children: [
    Icon(
     iconData,
     color: Colors.white,
    ),
    SizedBox(
     width: 12.0,
    ),
    Text(message, style: TextStyle(color: Colors.white)),
   ],
  ),
 );
 fToast.showToast(
  child: toast,
  gravity: ToastGravity.BOTTOM,
  toastDuration: Duration(seconds: 3),
 );
}
