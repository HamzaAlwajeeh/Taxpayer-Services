import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/switch_widget.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final bool? hasIcon;
  final bool? isSwitch;
  final bool? switchValue;
  final Function(bool)? onSwitchChanged;
  final void Function()? onTap;

  const ItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isSwitch,
    this.switchValue,
    this.onSwitchChanged,
    this.onTap,
    this.hasIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AppSettings.themeModeSignal.value == ThemeMode.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.itemsColor(context),
          borderRadius: BorderRadius.circular(AppSpacing.radius16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor(),
              blurRadius: 52,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.s8),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.customRed(),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  AppColors.textRedColor(context),
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.s8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.bold18.copyWith(
                      color: AppColors.textRedColor(context),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyles.bold14.copyWith(
                      color: AppColors.secondaryColor(context),
                    ),
                  ),
                ],
              ),
            ),
            isSwitch == true
                ? SwhitchWidget(
                  onChanged: (bool value) {
                    AppSettings.changeTheme();
                  },
                  isSelected: isDark,
                )
                : Visibility(
                  visible: hasIcon == null,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.secondaryColor(context),
                    size: 18,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
