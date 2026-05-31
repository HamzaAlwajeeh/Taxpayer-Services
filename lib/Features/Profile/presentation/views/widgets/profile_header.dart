import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/change_account_bottom_sheet.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/cashed_networ_image.dart';
import 'package:tax_payer/generated/l10n.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.image,
    required this.userName,
    required this.phone,
  });
  final String? image;
  final String userName;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).Profile,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyles.bold16.copyWith(
              color: AppColors.textPrimaryColor(context),
            ),
          ),
          const SizedBox(height: 5),
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: CustomImageWidget(
                  width: 85,
                  height: 85,
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              if (Prefs.getUser(AppConstants.kCurrentUser) != null)
                Positioned(
                  bottom: -5,
                  right: -10,
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.itemsColor(context),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.borderColor(context),
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => context.push(RouteNames.editProfile),
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.assetsIconsEdit,
                          colorFilter: ColorFilter.mode(
                            AppColors.textRedColor(context),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userName,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyles.bold18.copyWith(
                  color: AppColors.textRedColor(context),
                  height: 1.2,
                ),
              ),
              IconButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => const ChangeAccountBottomSheet(),
                  );
                },
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: AppColors.textRedColor(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            phone,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyles.bold16.copyWith(
              color: AppColors.textPrimaryColor(context),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
