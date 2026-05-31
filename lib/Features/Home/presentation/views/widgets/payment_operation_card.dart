import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/tax_information.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/helper/download_files.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class PaymentOperationCard extends StatelessWidget {
  const PaymentOperationCard({
    super.key,
    required this.taxInformation,
    required this.index,
  });

  final TaxInformation taxInformation;
  final int index;

  @override
  Widget build(BuildContext context) {
    final attachment = taxInformation.attachment?.trim();
    final hasAttachment = attachment != null && attachment.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: AppColors.itemsColor(context),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        border: Border.all(color: AppColors.borderColor(context)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor(context),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _IconLabel(
                    icon: Assets.assetsIconsCalendar,
                    label: 'عملية سداد',
                    isTitle: true,
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  _IconLabel(
                    icon: Assets.assetsIconsDollarCircle,
                    label: _formatAmount(context, taxInformation.lastPayment),
                    isTitle: false,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'عملية #${index + 1}',
                style: TextStyles.regular14.copyWith(
                  color: AppColors.textPrimaryColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s20),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed:
                  hasAttachment ? () => downloadAnyFile(url: attachment) : null,
              style: ElevatedButton.styleFrom(
                elevation: hasAttachment ? 8 : 0,
                shadowColor: AppColors.primaryColor(
                  context,
                ).withValues(alpha: 0.28),
                backgroundColor: AppColors.primaryColor(context),
                disabledBackgroundColor: AppColors.borderColor(context),
                foregroundColor: AppColors.white(),
                disabledForegroundColor: AppColors.textPrimaryColor(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radius12),
                ),
              ),
              child: Text(
                hasAttachment ? 'تحميل الملف' : 'لم يتم إرفاق ملف',
                style: TextStyles.bold20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatAmount(BuildContext context, String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) return S.of(context).NotAvailable;
    final number = num.tryParse(trimmed.replaceAll(',', ''));
    if (number == null) return trimmed;
    return number
        .toStringAsFixed(number.truncateToDouble() == number ? 0 : 2)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');
  }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel({
    required this.icon,
    required this.label,
    required this.isTitle,
  });

  final String icon;
  final String label;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.customRed(context, true),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                AppColors.textRedColor(context),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s8),
        Text(
          label,
          textAlign: TextAlign.right,
          style: (isTitle ? TextStyles.bold20 : TextStyles.bold18).copyWith(
            color: AppColors.textRedColor(context),
          ),
        ),
      ],
    );
  }
}
