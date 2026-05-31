import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/cashed_networ_image.dart';
import 'package:tax_payer/generated/l10n.dart';

class UserFileHeader extends StatelessWidget {
  const UserFileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Prefs.getUser(AppConstants.kCurrentUser);
    final userName = user?.firstName ?? S.of(context).Guest;

    return Row(
      children: [
        _UserAvatar(image: user?.image),
        const SizedBox(width: AppSpacing.s12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyles.bold18.copyWith(
                  color: AppColors.textBoldColor(context),
                ),
                children: [
                  TextSpan(text: '${S.of(context).Hello} '),
                  TextSpan(
                    text: userName,
                    style: TextStyle(color: AppColors.textRedColor(context)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s4),
            Text(
              'كيف حالك اليوم ؟',
              style: TextStyles.regular14.copyWith(
                color: AppColors.textSecondaryColor(context),
              ),
            ),
          ],
        ),
        const Spacer(),
        _ThemeButton(onPressed: AppSettings.changeTheme),
      ],
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.itemsColor(context),
      shape: const CircleBorder(),
      elevation: 8,
      shadowColor: AppColors.shadowColor(context),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 52,
          height: 52,
          child: Center(
            child: SvgPicture.asset(
              Assets.assetsIconsMoon,
              width: 26,
              height: 26,
              colorFilter: ColorFilter.mode(
                AppColors.textRedColor(context),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({required this.image});

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
