import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/change_account_bottom_sheet.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
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
    required this.tradeName,
    required this.fileStatus,
  });

  final String? image;
  final String userName;
  final String phone;
  final String tradeName;
  final String fileStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 190),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s20,
        vertical: AppSpacing.s20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor(context),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor(context).withValues(alpha: 0.18),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            start: -18,
            bottom: -28,
            child: Icon(
              Icons.person,
              size: 118,
              color: AppColors.white().withValues(alpha: 0.14),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        child: CustomImageWidget(
                          width: 76,
                          height: 76,
                          image: image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (Prefs.getUser(AppConstants.kCurrentUser) != null)
                        PositionedDirectional(
                          bottom: -4,
                          end: -8,
                          child: GestureDetector(
                            onTap: () => context.push(RouteNames.editProfile),
                            child: Container(
                              width: 34,
                              height: 34,
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.itemsColor(context),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.borderColor(context),
                                  width: 1,
                                ),
                              ),
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
                    ],
                  ),
                  const SizedBox(width: AppSpacing.s14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Profile,
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.white().withValues(alpha: 0.85),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.s4),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                userName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bold24.copyWith(
                                  color: AppColors.white(),
                                  height: 1.2,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder:
                                      (context) =>
                                          const ChangeAccountBottomSheet(),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: AppColors.white(),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          phone,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.semiBold16.copyWith(
                            color: AppColors.white().withValues(alpha: 0.9),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              Wrap(
                spacing: AppSpacing.s8,
                runSpacing: AppSpacing.s8,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.s12,
                      vertical: AppSpacing.s8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white().withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Text(
                      '${S.of(context).TradeNameField}: $tradeName',
                      style: TextStyles.bold14.copyWith(
                        color: AppColors.white(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.s12,
                      vertical: AppSpacing.s8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white().withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Text(
                      '${S.of(context).FileStatus}: $fileStatus',
                      style: TextStyles.bold14.copyWith(
                        color: AppColors.white(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
