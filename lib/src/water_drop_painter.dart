import 'package:flutter/material.dart';

class WaterDropPainter extends CustomPainter {
  final Color color;
  final TextDirection textDirection;

  WaterDropPainter(this.color, this.textDirection);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    double widthFactor = textDirection == TextDirection.rtl ? -1 : 1;
    double xOffset = textDirection == TextDirection.rtl ? size.width : 0;

    path.cubicTo(
      xOffset + size.width * 0.239841 * widthFactor,
      size.height * 0.06489535,
      xOffset + size.width * 0.285956 * widthFactor,
      size.height * 0.4886860,
      xOffset + size.width * 0.42016 * widthFactor,
      size.height * 0.8271512,
    );
    path.cubicTo(
      xOffset + size.width * 0.467771 * widthFactor,
      size.height * 0.9466628,
      xOffset + size.width * 0.530574 * widthFactor,
      size.height * 0.9472209,
      xOffset + size.width * 0.578344 * widthFactor,
      size.height * 0.8285814,
    );
    path.cubicTo(
        xOffset + size.width * 0.7185669 * widthFactor,
        size.height * 0.4786744,
        xOffset + size.width * 0.757325 * widthFactor,
        size.height * 0.06629070,
        xOffset + size.width * 0.999682 * widthFactor,
        0);
    path.lineTo(xOffset, 0);
    path.close();

    Paint fillColor = Paint()..style = PaintingStyle.fill;

    fillColor.color = color;
    canvas.drawPath(path, fillColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
