import 'package:flutter/material.dart';
import 'package:tax_payer/Features/DashBoard/data/models/files/file.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

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
    return Material(
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
              Icon(
                Icons.folder_copy_outlined,
                color:
                    isSelected ? AppColors.primaryColor(context) : Colors.grey,
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
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: AppColors.primaryColor(context),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
