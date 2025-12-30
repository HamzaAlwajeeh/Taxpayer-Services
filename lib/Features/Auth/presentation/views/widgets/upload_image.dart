import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant_app/core/helper/take_photo.dart';
import 'package:marchant_app/core/utils/app_colors.dart';
import 'package:marchant_app/core/utils/app_images.dart';
import 'package:marchant_app/core/utils/app_text_style.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  File? imagePath;
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

  void _selectImage() async {
    File? image = await takePhoto();
    if (image != null) {
      setState(() {
        imagePath = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      animation: _controller,
      options: RoundedRectDottedBorderOptions(
        color: AppColors.textPrimaryColor,
        strokeWidth: 2,
        dashPattern: [6, 6],
        radius: Radius.circular(12),
      ),
      child:
          imagePath != null
              ? OpenImage(imagePath: imagePath!)
              : SelectImage(
                title: widget.title,
                subTitle: widget.subTitle,
                onImageSelected: _selectImage,
              ),
    );
  }
}

class OpenImage extends StatelessWidget {
  const OpenImage({super.key, required this.imagePath});
  final File imagePath;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(imagePath, width: double.infinity),
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
  final VoidCallback onImageSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImageSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.textFeilColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.assetsImagesImagesIcon),
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
