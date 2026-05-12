import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/language_item_bottom_sheet.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/generated/l10n.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = AppSettings.localeSignal.watch(context).languageCode;
    final isArabic = currentLang == AppConstants.kArabicLang;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.customRed(context),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(
              Assets.assetsIconsGlobal,
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(
                AppColors.textRedColor(context),
                BlendMode.srcIn,
              ),
            ),
          ),

          const SizedBox(height: 32),
          languageItemBottomSheet(
            context: context,
            title: S.of(context).Arabic,
            badgeText: 'AR',
            isActive: isArabic,
            langCode: AppConstants.kArabicLang,
          ),
          const SizedBox(height: 16),
          languageItemBottomSheet(
            context: context,
            title: S.of(context).English,
            badgeText: 'EN',
            isActive: !isArabic,
            langCode: AppConstants.kEnglishLang,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
