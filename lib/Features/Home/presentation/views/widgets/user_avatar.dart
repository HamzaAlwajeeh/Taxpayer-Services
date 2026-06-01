import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/cashed_networ_image.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 66,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.textRedColor(context), width: 2),
      ),
      child: ClipOval(
        child:
            image == null || image!.trim().isEmpty
                ? Container(
                  color: AppColors.customRed(context, true),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.assetsIconsUser,
                      width: 30,
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        AppColors.textRedColor(context),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
                : CustomImageWidget(image: image, fit: BoxFit.cover),
      ),
    );
  }
}
