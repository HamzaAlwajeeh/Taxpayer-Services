import 'package:flutter/material.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/business_info_tile.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class BusinessActivitySection extends StatelessWidget {
  const BusinessActivitySection({super.key, required this.userFile});

  final UserFile userFile;

  @override
  Widget build(BuildContext context) {
    final file = userFile.file;
    final taxPayer = userFile.taxPayer;
    final taxAmount =
        userFile.taxInformations?.isNotEmpty == true
            ? userFile.taxInformations!.first.taxAmount
            : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'معلومات النشاط التجاري',
          textAlign: TextAlign.right,
          style: TextStyles.bold22.copyWith(
            color: AppColors.textRedColor(context),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        Row(
          children: [
            Expanded(
              child: BusinessInfoTile(
                title: 'الرقم الحصري',
                value: _valueOrFallback(context, file?.inventoryNumber),
                icon: Assets.assetsIconsCard,
              ),
            ),
            const SizedBox(width: AppSpacing.s12),
            Expanded(
              child: BusinessInfoTile(
                title: 'الاسم التجاري',
                value: _valueOrFallback(context, taxPayer?.tradeName),
                icon: Assets.assetsIconsActivity,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s12),
        BusinessInfoTile(
          title: 'الضريبة الحالية',
          value: _formatAmount(context, taxAmount),
          icon: Assets.assetsIconsDollarCircle,
          isWide: true,
        ),
        const SizedBox(height: AppSpacing.s12),
        Row(
          children: [
            Expanded(
              child: BusinessInfoTile(
                title: 'نوع الدفع',
                value: _valueOrFallback(context, file?.paymentType),
                icon: Assets.assetsIconsWallet,
              ),
            ),
            const SizedBox(width: AppSpacing.s12),
            Expanded(
              child: BusinessInfoTile(
                title: 'حالة الملف',
                value: _valueOrFallback(context, file?.fileStatus),
                icon: Assets.assetsIconsStatusUp,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s12),
        BusinessInfoTile(
          title: 'تاريخ مزاولة النشاط التجاري',
          value: _valueOrFallback(context, file?.activityStartDate),
          icon: Assets.assetsIconsCalendar,
          isWide: true,
        ),
      ],
    );
  }

  String _formatAmount(BuildContext context, String? value) {
    final normalized = _valueOrFallback(context, value);
    final number = num.tryParse(normalized.replaceAll(',', ''));
    if (number == null) return normalized;
    return number
        .toStringAsFixed(number.truncateToDouble() == number ? 0 : 2)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');
  }

  String _valueOrFallback(BuildContext context, String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) return S.of(context).NotAvailable;
    return trimmed;
  }
}
