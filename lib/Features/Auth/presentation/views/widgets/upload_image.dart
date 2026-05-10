import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/upload_image_controller.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isStoreImage,
    this.onImageChanged,
  });
  final String title;
  final String subTitle;
  final bool isStoreImage;
  final ValueChanged<File?>? onImageChanged;
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadImageController>(
      init: UploadImageController(),
      builder: (controller) {
        final image =
            widget.isStoreImage
                ? controller.storeImagePath
                : controller.imagePath;
        return FormField<File?>(
          validator: (value) {
            if (image == null) {
              return S.of(context).ImageIsRequired;
            }
            return null;
          },
          builder: (formState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  animation: _controller,
                  options: RoundedRectDottedBorderOptions(
                    color: AppColors.primaryColor(context),
                    strokeWidth: 2,
                    dashPattern: [6, 6],
                    radius: Radius.circular(12),
                  ),
                  child:
                      image != null
                          ? OpenImage(
                            imagePath: image,
                            onRemove: () {
                              controller.removeImage(
                                isStoreImage: widget.isStoreImage,
                              );
                              formState.didChange(null);
                              widget.onImageChanged?.call(null);
                            },
                          )
                          : SelectImage(
                            title: widget.title,
                            subTitle: widget.subTitle,
                            onImageSelected: () async {
                              final selectedImage = await controller
                                  .showImageSourceDialog(
                                    context,
                                    isStoreImage: widget.isStoreImage,
                                  );
                              if (selectedImage != null) {
                                formState.didChange(selectedImage);
                                widget.onImageChanged?.call(selectedImage);
                              }
                            },
                          ),
                ),
                if (formState.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 12),
                    child: Text(
                      formState.errorText!,
                      style: TextStyles.semiBold14.copyWith(
                        color: AppColors.red().withValues(alpha: 0.8),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

class OpenImage extends StatelessWidget {
  const OpenImage({super.key, required this.imagePath, required this.onRemove});
  final File imagePath;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(imagePath, width: double.infinity),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.red().withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.delete, color: AppColors.red(), size: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectImage extends StatelessWidget {
  const SelectImage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onImageSelected,
  });
  final String title;
  final String subTitle;
  final Future<void> Function() onImageSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImageSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.textFeilColor(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.assetsIconsUploadFiles,
              width: 35,
              colorFilter: ColorFilter.mode(
                AppColors.textRedColor(context),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyles.bold16.copyWith(color: Color(0xff525252)),
            ),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: TextStyles.bold14.copyWith(color: Color(0xffA3A3A3)),
            ),
          ],
        ),
      ),
    );
  }
}
