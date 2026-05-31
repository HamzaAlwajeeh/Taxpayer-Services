import 'package:flutter/material.dart';
import 'package:tax_payer/Features/DashBoard/data/models/files/file.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class UserFileCard extends StatelessWidget {
  const UserFileCard({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.itemsColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor(context), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor(context).withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor(context).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.insert_drive_file,
                    color: AppColors.primaryColor(context),
                  ),
                ),
                const SizedBox(width: AppSpacing.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.tradeName ?? S.of(context).UnknownFile,
                        style: TextStyles.semiBold16.copyWith(
                          color: AppColors.textBoldColor(context),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.s4),
                      Text(
                        '${S.of(context).FileType}: ${file.fileType}',
                        style: TextStyles.regular14.copyWith(
                          color: AppColors.textSecondaryColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.s16),
            _buildInfoRow(
              context,
              S.of(context).TaxNumber,
              file.taxNumber.toString(),
            ),
            const SizedBox(height: AppSpacing.s8),
            _buildInfoRow(
              context,
              S.of(context).InventoryNumber,
              file.inventoryNumber.toString(),
            ),
            const SizedBox(height: AppSpacing.s8),
            _buildInfoRow(
              context,
              S.of(context).ActivityStartDate,
              file.activityStartDate ?? S.of(context).NotAvailable,
            ),
            const SizedBox(height: AppSpacing.s8),
            _buildInfoRow(
              context,
              S.of(context).FileStatus,
              file.fileStatus ?? S.of(context).NotAvailable,
            ),
            const SizedBox(height: AppSpacing.s16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // TODO: Add navigation to file details
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor(context)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    S.of(context).ViewDetails,
                    style: TextStyle(color: AppColors.primaryColor(context)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: TextStyles.semiBold14.copyWith(
            color: AppColors.textSecondaryColor(context),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyles.regular14.copyWith(
              color: AppColors.textPrimaryColor(context),
            ),
          ),
        ),
      ],
    );
  }
}
