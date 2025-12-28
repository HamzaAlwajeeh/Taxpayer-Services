import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant_app/core/utils/app_colors.dart';
import 'package:marchant_app/core/utils/app_images.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child, this.hasImage});
  final Widget child;
  final bool? hasImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -44,
          left: -233,
          child: _BlurCircle(
            color: Colors.purpleAccent.withOpacity(0.35),
            size: 350,
          ),
        ),
        Positioned(
          top: 120,
          left: 233,
          child: _BlurCircle(
            color: AppColors.primaryColor.withOpacity(0.35),
            size: 350,
          ),
        ),
        Visibility(
          visible: hasImage ?? false,
          child: Positioned(
            bottom: 0,
            right: 0,
            top: -530,
            child: SvgPicture.asset(Assets.assetsImagesBackImage),
          ),
        ),
        child,
      ],
    );
  }
}

class _BlurCircle extends StatelessWidget {
  final Color color;
  final double size;

  const _BlurCircle({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _BlurCirclePainter(color: color, size: size),
    );
  }
}

class _BlurCirclePainter extends CustomPainter {
  final Color color;
  final double size;

  _BlurCirclePainter({required this.color, required this.size});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            50,
          ); // Blur effect

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
