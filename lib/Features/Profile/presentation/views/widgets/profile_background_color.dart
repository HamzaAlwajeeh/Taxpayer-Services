import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';

class ProfileBackgroundColor extends StatelessWidget {
  const ProfileBackgroundColor({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SvgPicture.asset(
          Assets.assetsImagesProfileBackgroundColor,
          fit: BoxFit.cover,
          colorFilter:
              isDark
                  ? ColorFilter.mode(
                    AppColors.customRed(context, true),
                    BlendMode.srcIn,
                  )
                  : ColorFilter.mode(
                    AppColors.itemsColor(context),
                    BlendMode.srcIn,
                  ),
        ),
      ),
    );
  }
}
