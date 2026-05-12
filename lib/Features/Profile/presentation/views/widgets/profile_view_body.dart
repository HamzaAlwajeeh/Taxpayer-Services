import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_background_color.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_custom_button.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_header.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/setting_items.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = Prefs.getUser(AppConstants.kCurrentUser);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        ProfileBackgroundColor(isDark: isDark),
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
                          : 'ضيف',
                  phone: user?.phone ?? '',
                ),
                SizedBox(height: 24),
                SettingItems(),
                SizedBox(height: 24),
                PofileCustomButton(user: user),
                SizedBox(height: 16),
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
