import 'package:agriteck_admin/styles/app-colors.dart';
import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paintMain = Paint();

    paintMain.color = primaryLight.withOpacity(0.3);

    paintMain.style = PaintingStyle.fill;

    var pathMain = Path();

    pathMain.moveTo(size.width, 0);
    pathMain.quadraticBezierTo(
        size.width / 6, size.height * 0.4, size.width * 0.8, size.height * 0.4);
    pathMain.quadraticBezierTo(
        size.width, size.height * 0.4, size.width * 0.8, size.height * 0.6);
    pathMain.quadraticBezierTo(
        size.width * 0.7, size.height * 0.7, size.width, size.height * 0.8);
    pathMain.lineTo(size.width, size.height);

    canvas.drawPath(pathMain, paintMain);

    var paintShadow = Paint();

    paintShadow.color = primaryLight.withOpacity(0.1);
    paintShadow.style = PaintingStyle.fill;

    var pathShadow = Path();

    pathShadow.moveTo(size.width, size.height * 0.2);
    pathShadow.quadraticBezierTo(size.width / 10, size.height * 0.4,
        size.width * 0.8, size.height * 0.5);
    pathShadow.quadraticBezierTo(
        size.width, size.height * 0.5, size.width * 0.8, size.height * 0.6);
    pathShadow.lineTo(size.width, size.height * 0.5);

    canvas.drawPath(pathShadow, paintShadow);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}