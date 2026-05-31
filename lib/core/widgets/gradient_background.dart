import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
    this.hasImage,
    this.backgroundColors,
  });

  final Widget child;
  final bool? hasImage;
  final Widget? backgroundColors;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.textRedColor(context);

    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: BackgroundPatternPainter(color: primary.withOpacity(0.15)),
          ),
        ),

        Positioned(
          top: -120,
          right: -100,
          child: _glassCircle(280, primary.withOpacity(0.20)),
        ),

        Positioned(
          bottom: -80,
          left: -70,
          child: _glassCircle(220, primary.withOpacity(0.20)),
        ),

        Positioned(
          top: 220,
          left: -40,
          child: _glassCircle(140, primary.withOpacity(0.14)),
        ),

        Positioned(
          top: 120,
          right: 40,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: primary.withOpacity(0.30)),
            ),
          ),
        ),

        Positioned(
          bottom: 150,
          right: 50,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: primary.withOpacity(0.30)),
            ),
          ),
        ),

        child,
      ],
    );
  }

  Widget _glassCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  final Color color;

  BackgroundPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    const spacing = 28.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.6, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
