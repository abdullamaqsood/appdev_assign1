import 'package:flutter/material.dart';

class CustomAppBar extends OutlinedBorder {
  const CustomAppBar({super.side});

  Path _generatePath(Rect rect) {
    final Path path = Path();
    final Size size = Size(rect.width, rect.height * 2.5);

    final double startY = size.height * 0.88;
    final double controlPoint1Y = size.height * 0.67;
    final double peakX1 = size.width * 0.48;
    final double peakY1 = size.height * 0.96;

    final double controlPoint2Y = size.height * 1.01;
    final double peakX2 = size.width;
    final double peakY2 = size.height * 0.88;

    path.moveTo(0, startY);

    path.quadraticBezierTo(
      size.width * 0.26,
      controlPoint1Y,
      peakX1,
      peakY1,
    );

    path.quadraticBezierTo(
      size.width * 0.81,
      controlPoint2Y,
      peakX2,
      peakY2,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _generatePath(rect.inflate(side.width));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _generatePath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) return;

    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFFCBF49),
          const Color(0xFFF77F00),
          const Color(0xFFDC7100),
        ],
      ).createShader(rect);

    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return CustomAppBar(side: side.scale(t));
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return CustomAppBar(side: side ?? this.side);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomAppBar) {
      return CustomAppBar(side: BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomAppBar) {
      return CustomAppBar(side: BorderSide.lerp(b.side, side, t));
    }
    return super.lerpTo(b, t);
  }
}
