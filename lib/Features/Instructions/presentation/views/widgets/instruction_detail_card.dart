import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class InstructionDetailCard extends StatelessWidget {
  final String sectionTitle;
  final IconData sectionIcon;
  final List<String> items;
  final String? note;
  final Color? accentColor;

  const InstructionDetailCard({
    super.key,
    required this.sectionTitle,
    required this.sectionIcon,
    required this.items,
    this.note,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? AppColors.primaryColor(context);

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s16),
      decoration: BoxDecoration(
        color: AppColors.itemsColor(context),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor(context),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s16,
              vertical: AppSpacing.s12,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.12),
                  color.withOpacity(0.04),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.radius16),
                topRight: Radius.circular(AppSpacing.radius16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.s8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppSpacing.radius12),
                  ),
                  child: Icon(sectionIcon, color: color, size: 22),
                ),
                const SizedBox(width: AppSpacing.s12),
                Expanded(
                  child: Text(
                    sectionTitle,
                    style: TextStyles.bold16.copyWith(
                      color: AppColors.textBoldColor(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s16,
              vertical: AppSpacing.s12,
            ),
            child: Column(
              children: List.generate(items.length, (index) {
                return _buildItemRow(context, index + 1, items[index], color);
              }),
            ),
          ),
          if (note != null) ...[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                AppSpacing.s16,
                0,
                AppSpacing.s16,
                AppSpacing.s16,
              ),
              padding: const EdgeInsets.all(AppSpacing.s12),
              decoration: BoxDecoration(
                color: const Color(0xffFFF8E1),
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
                border: Border.all(
                  color: const Color(0xffFFD54F).withOpacity(0.5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xffF57F17),
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.s8),
                  Expanded(
                    child: Text(
                      note!,
                      style: TextStyles.regular14.copyWith(
                        color: const Color(0xff5D4037),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }


  Widget _buildItemRow(
    BuildContext context,
    int number,
    String text,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.s10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color, color.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyles.bold14.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                text,
                style: TextStyles.regular14.copyWith(
                  color: AppColors.textBoldColor(context),
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
