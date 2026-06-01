import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/theme_button.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/user_avatar.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class UserFileHeader extends StatelessWidget {
  const UserFileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Prefs.getUser(AppConstants.kCurrentUser);
    final userName = user?.firstName ?? S.of(context).Guest;

    return Row(
      children: [
        UserAvatar(image: user?.image),
        const SizedBox(width: AppSpacing.s12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyles.bold18.copyWith(
                  color: AppColors.textBoldColor(context),
                ),
                children: [
                  TextSpan(text: '${S.of(context).Hello} '),
                  TextSpan(
                    text: userName,
                    style: TextStyle(color: AppColors.textRedColor(context)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s4),
            Text(
              S.of(context).HowAreYouToday,
              style: TextStyles.regular14.copyWith(
                color: AppColors.textSecondaryColor(context),
              ),
            ),
          ],
        ),
        const Spacer(),
        ThemeButton(onPressed: AppSettings.changeTheme),
      ],
    );
  }
}
