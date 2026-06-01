import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/change_account_bottom_sheet.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
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
    final isLoggedIn = Prefs.getBool(AppConstants.kIsLogedIn);
    final currentLang = AppSettings.localeSignal.watch(context).languageCode;
    final isArabic = currentLang == AppConstants.kArabicLang;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.s20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryColor(context),
                  AppColors.primaryColor(context).withValues(alpha: 0.88),
                ],
              ),
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor(
                    context,
                  ).withValues(alpha: 0.18),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppColors.white().withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CustomImageWidget(
                          width: 78,
                          height: 78,
                          image: image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: AppSpacing.s16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  userName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.bold24.copyWith(
                                    color: AppColors.white(),
                                    height: 1.1,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Text(
                            phone,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.semiBold16.copyWith(
                              color: AppColors.white().withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.s20),

                Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        title: S.of(context).TradeNameField,
                        value: tradeName,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s10),
                    Expanded(
                      child: _InfoCard(
                        title: S.of(context).FileStatus,
                        value: fileStatus,
                      ),
                    ),
                  ],
                ),

                if (Prefs.getUser(AppConstants.kCurrentUser) != null) ...[
                  const SizedBox(height: AppSpacing.s16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.push(RouteNames.editProfile);
                      },
                      icon: SvgPicture.asset(
                        Assets.assetsIconsEdit,
                        width: 18,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                          AppColors.white(),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: Text(
                        S.of(context).EditProfile,
                        style: TextStyles.bold14.copyWith(
                          color: AppColors.white(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.white().withValues(
                          alpha: 0.12,
                        ),
                        foregroundColor: AppColors.white(),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.s14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radius12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // 🟡 BACKGROUND CIRCLES (NON-INTERACTIVE)
          Positioned(
            top: -40,
            right: isArabic ? null : -40,
            left: isArabic ? -40 : null,
            child: IgnorePointer(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white().withValues(alpha: 0.08),
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: isArabic ? null : 20,
            left: isArabic ? 20 : null,
            child: IgnorePointer(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white().withValues(alpha: 0.05),
                ),
              ),
            ),
          ),

          // 🔥 CHANGE ACCOUNT BUTTON (TOP LAYER FIXED)
          if (isLoggedIn)
            Positioned(
              top: 12,
              right: isArabic ? null : 12,
              left: isArabic ? 12 : null,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => const ChangeAccountBottomSheet(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.white().withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.white(),
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s12),
      decoration: BoxDecoration(
        color: AppColors.white().withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: AppColors.white().withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.semiBold12.copyWith(
              color: AppColors.white().withValues(alpha: 0.75),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.bold14.copyWith(color: AppColors.white()),
          ),
        ],
      ),
    );
  }
}
