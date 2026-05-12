import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_view_body.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        backgroundColors: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                Assets.assetsImagesProfileImage,
                colorFilter: ColorFilter.mode(
                  AppColors.customRed(),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        child: const ProfileViewBody(),
      ),
    );
  }
}
