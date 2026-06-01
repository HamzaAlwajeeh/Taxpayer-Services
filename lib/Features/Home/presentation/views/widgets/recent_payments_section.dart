import 'package:flutter/material.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/payment_operation_card.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/section_icon.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class RecentPaymentsSection extends StatelessWidget {
  const RecentPaymentsSection({super.key, required this.userFile});

  final UserFile userFile;

  @override
  Widget build(BuildContext context) {
    final taxInformations = userFile.taxInformations ?? [];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: AppColors.itemsColor(context),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        border: Border.all(color: AppColors.borderColor(context)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SectionIcon(icon: Assets.assetsIconsCalendar),
              const SizedBox(width: AppSpacing.s8),
              Text(
                S.of(context).RecentPayments,
                style: TextStyles.bold22.copyWith(
                  color: AppColors.textRedColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s20),
          if (taxInformations.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.s24),
              child: Text(
                S.of(context).NotAvailable,
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.textPrimaryColor(context),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: taxInformations.length,
              separatorBuilder:
                  (context, index) => const SizedBox(height: AppSpacing.s16),
              itemBuilder:
                  (context, index) => PaymentOperationCard(
                    taxInformation: taxInformations[index],
                    index: index,
                  ),
            ),
        ],
      ),
    );
  }
}
