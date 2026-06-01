import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/hero_icon_container.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class BusinessInfoTile extends StatelessWidget {
  const BusinessInfoTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.isWide = false,
  });

  final String title;
  final String value;
  final String icon;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.textRedColor(context);

    return Container(
      constraints: BoxConstraints(minHeight: isWide ? 120 : 132),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.itemsColor(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor(context), width: 1.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroIconContainer(icon: icon),

          const SizedBox(height: 14),

          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.bold18.copyWith(
              color: AppColors.textBoldColor(context),
              height: 1.2,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.bold16.copyWith(
                color: primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
