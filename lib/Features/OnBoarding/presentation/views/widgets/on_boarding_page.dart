import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_payer/Features/OnBoarding/data/models/on_boarding_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.page});

  final OnBoardingModel page;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Transform.translate(
        offset: const Offset(0, 90),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: page.leftTopPosition,
              child: SvgPicture.asset(page.leftArrow, fit: BoxFit.contain),
            ),
            Positioned(
              right: 0,
              top: page.rightTopPosition,
              child: SvgPicture.asset(page.rightArrow, fit: BoxFit.contain),
            ),

            Center(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width * 0.95,
                maxHeight: MediaQuery.of(context).size.height * 0.85,
                child: Image.asset(
                  page.image,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
