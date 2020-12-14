import 'dart:ui';

import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = myGreen;
    paint.style = PaintingStyle.fill;

    var path = new Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.25,
          size.width * 0.5, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.8, size.height * 0.35, size.width, size.height * 0.25)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
