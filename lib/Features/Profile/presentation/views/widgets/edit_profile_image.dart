import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_payer/core/helper/upload_image_controller.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/cashed_networ_image.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({
    super.key,
    this.currentImage,
    required this.onImageChanged,
  });

  final String? currentImage;
  final ValueChanged<File?> onImageChanged;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadImageController>(
      init: UploadImageController(),
      builder: (controller) {
        final image = controller.imagePath;

        return Center(
          child: GestureDetector(
            onTap: () async {
              final selectedImage = await controller.showImageSourceDialog(
                context,
                isStoreImage: false,
              );
              if (selectedImage != null) {
                onImageChanged(selectedImage);
              }
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor(context),
                      width: 2,
                    ),
                    color: AppColors.primaryColor(
                      context,
                    ).withValues(alpha: 0.1),
                  ),
                  child: ClipOval(
                    child:
                        image != null
                            ? Image.file(image, fit: BoxFit.cover)
                            : (currentImage != null
                                ? CustomImageWidget(
                                  image: currentImage,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                                : Icon(
                                  Icons.person,
                                  size: 50,
                                  color: AppColors.primaryColor(context),
                                )),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: -10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.itemsColor(context),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor(context),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.textRedColor(context),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
