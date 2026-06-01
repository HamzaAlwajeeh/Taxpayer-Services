import 'package:flutter/material.dart';
import 'package:tax_payer/Features/DashBoard/data/models/files/file.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/cashed_networ_image.dart';

class FileItemWidget extends StatelessWidget {
  final File file;
  final VoidCallback onTap;
  final bool isSelected;

  const FileItemWidget({
    super.key,
    required this.file,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final user = Prefs.getUser(AppConstants.kCurrentUser);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.primaryColor(context).withOpacity(0.1)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    isSelected
                        ? AppColors.primaryColor(context)
                        : Colors.grey.shade300,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          isSelected
                              ? AppColors.primaryColor(context)
                              : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: CustomImageWidget(
                      image: user?.image,
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.tradeName ?? 'No Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textBoldColor(context),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        file.fileType ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondaryColor(context),
                        ),
                      ),
                    ],
                  ),
                ),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child:
                      isSelected
                          ? Icon(
                            Icons.check_circle,
                            key: const ValueKey('selected'),
                            color: AppColors.primaryColor(context),
                          )
                          : const SizedBox(key: ValueKey('empty'), width: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
