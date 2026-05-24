import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/user_profile_cubit/user_profile_cubit.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/user_profile_cubit/user_profile_state.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_background_color.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_custom_button.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/profile_header.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/setting_items.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/generated/l10n.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();
    if (Prefs.getBool(AppConstants.kIsLogedIn) == true) {
      context.read<UserProfileCubit>().getUserProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        User? user =
            context.read<UserProfileCubit>().currentUser ??
            Prefs.getUser(AppConstants.kCurrentUser);
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
                              : S.of(context).Guest,
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
                        '${S.of(context).AppVersion} ${AppConstants.kAppVersion}',
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
      },
    );
  }
}
