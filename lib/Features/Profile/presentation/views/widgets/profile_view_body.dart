import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_state.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_header.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/setting_items.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = Prefs.getUser(AppConstants.kCurrentUser);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Positioned(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              Assets.assetsImagesProfileBackgroundColor,
              fit: BoxFit.cover,
              colorFilter:
                  isDark
                      ? ColorFilter.mode(
                        AppColors.customRed(context, true),
                        BlendMode.srcIn,
                      )
                      : ColorFilter.mode(
                        AppColors.itemsColor(context),
                        BlendMode.srcIn,
                      ),
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.s16,
              right: AppSpacing.s16,
              top: 56,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(
                  image: user?.image,
                  userName:
                      user != null
                          ? "${user.firstName} ${user.lastName}"
                          : 'Guest',
                  phone: user?.phone ?? '',
                ),
                SizedBox(height: 24),
                SettingItems(),
                SizedBox(height: 24),
                BlocConsumer<LogoutCubit, LogoutState>(
                  listener: (context, state) {
                    if (state is LogoutSuccess) {
                      customToastBar(
                        context: context,
                        message: S.of(context).LogoutSuccess,
                        backgroundColor: AppColors.customGreen(),
                        icon: Icons.check,
                        textColor: AppColors.white(),
                      );
                      Prefs.setBool(AppConstants.kIsLogedIn, false);
                      Prefs.removeUser(AppConstants.kCurrentUser);
                      context.go(RouteNames.login);
                    }
                  },
                  builder: (BuildContext context, state) {
                    if (user == null) {
                      return CustomButton(
                        isLogout: true,
                        textColor: AppColors.primaryColor(context),
                        borderColor: AppColors.primaryColor(context),
                        backgroundColor: Color(0xffAA1212).withOpacity(0.2),
                        title: S.of(context).Login,
                        onPressed: () {
                          context.go(RouteNames.login);
                        },
                      );
                    }
                    return state is LogoutLoading
                        ? CustomLoadingIndicator()
                        : CustomButton(
                          title: S.of(context).Logout,
                          onPressed: () {
                            BlocProvider.of<LogoutCubit>(context).logout();
                          },
                        );
                  },
                ),

                SizedBox(height: 16),

                // Version Info
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    AppConstants.kAppVersion,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryColor(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
