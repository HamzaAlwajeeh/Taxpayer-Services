import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/cashed_networ_image.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.iconSize,
  });

  final String? image;
  final double? width;
  final double? height;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 66,
      height: height ?? 66,
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
                      width: iconSize ?? 30,
                      height: iconSize ?? 30,
                      colorFilter: ColorFilter.mode(
                        AppColors.textRedColor(context, true),
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
