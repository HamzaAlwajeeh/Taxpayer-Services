import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_payer/core/helper/pick_file.dart';
import 'package:tax_payer/core/helper/take_photo.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class UploadImageController extends GetxController {
  File? imagePath;
  File? storeImagePath;
  void removeImage({required bool isStoreImage}) {
    isStoreImage ? storeImagePath = null : imagePath = null;
    update();
  }

  void pickCameraImage({required bool isStoreImage}) async {
    File? image = await takePhoto();
    if (image != null) {
      isStoreImage ? storeImagePath = image : imagePath = image;
      update();
    }
  }

  void pickFileImage({required bool isStoreImage}) async {
    String? path = await pickFile(allowedExtensions: ['jpg', 'png', 'jpeg']);
    if (path != null) {
      isStoreImage ? storeImagePath = File(path) : imagePath = File(path);
      update();
    }
  }

  void showImageSourceDialog(
    BuildContext context, {
    required bool isStoreImage,
  }) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text("مصدر الصورة ", style: TextStyles.bold16),
          content: Text(
            "اختر من حيث تريد اختيار الصورة",
            style: TextStyles.semiBold14,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "الغاء",
                style: TextStyles.bold14.copyWith(
                  color: AppColors.red.withOpacity(0.7),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                pickCameraImage(isStoreImage: isStoreImage);
              },
              child: Text(
                "الكاميرا",
                style: TextStyles.bold14.copyWith(
                  color: AppColors.textPrimaryColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                pickFileImage(isStoreImage: isStoreImage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                "تحميل ملف",
                style: TextStyles.bold14.copyWith(
                  color: AppColors.textPrimaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
