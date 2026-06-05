import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.color, this.isChat});

  final String title;
  final Color? color;
  final bool? isChat;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? AppColors.primaryColor(context),
      elevation: 0,
      centerTitle: isChat != true,
      titleSpacing: isChat == true ? 0 : NavigationToolbar.kMiddleSpacing,

      flexibleSpace: ClipRRect(
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -30,
              left: -30,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),

      title:
          isChat == true
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(Assets.assetsIconsAppIcon),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyles.bold18.copyWith(color: AppColors.white()),
                  ),
                ],
              )
              : Text(
                title,
                style: TextStyles.bold18.copyWith(color: AppColors.white()),
              ),

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => context.pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
